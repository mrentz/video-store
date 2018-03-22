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
