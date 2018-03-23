require 'elasticsearch/model'

class Video < ApplicationRecord

  validates_uniqueness_of :title, :case_sensitive => false

  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks
  
 def as_indexed_json(options={})
  {
    "rating" => content_rating,
    "title" => title,
    "actors" => actors,
    "theme" => theme
  }
 end

 def self.search(query)
  __elasticsearch__.search(
    {
      query: {
        query_string: {
          fields: ['title', 'actors', 'theme', 'rating'],
          query: query,
        }
      }
    }
  )
 end

 def self.get_actors_lastname(actors_list)
   last_name = []
   actors = actors_list.split(",")
   actors.each do |name|
     last_name.push(name.split(" ").last)
   end
     last_names = last_name.join(", ")
   return last_names
 end
 
 def self.setup_multi_term_search(match_term = "empty,") 
   match_term = match_term.nil? ? "empty, nil" : match_term
   search_terms = match_term.split(", ")
   terms = search_terms.join("+")
   return terms
 end
 
 def self.suggestions(video)
   actors = get_actors_lastname(video.actors)
   suggestions = Video.search("#{video.content_rating}^5 OR #{setup_multi_term_search(actors)} OR #{setup_multi_term_search(video.theme)}^10")[1,3]
   puts "suggestions.size: " + suggestions.size.inspect
   puts "suggestions: " + suggestions.inspect
   return suggestions
 end
 
 def self.custom_search(search_string, search_fields)
   return all if search_string.blank?
   if search_fields.blank?
     videos = Video.where("title ~* ?", search_string)
   else
     videos = Video.where("#{search_fields.pop} ~* ?", search_string)
     search_fields.each do |field|
       videos = videos.or(Video.where("#{field} ~* ?", search_string))
     end
     return videos
   end    
 end
 
end

Video.import force: true 
