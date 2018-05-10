# == Schema Information
#
# Table name: videos
#
#  id             :integer          not null, primary key
#  title          :string
#  description    :string
#  content_rating :string
#  rating         :integer
#  actors         :string
#  thumbnail      :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  theme          :text
#  stars          :string
#  release_date   :string
#  user_id        :integer
#

require 'elasticsearch/model'

#rdoc here
class Video < ApplicationRecord

  belongs_to :user
  #don't use rocket syntax anymore should be "case_sensitive: false"
  validates_uniqueness_of :title, :case_sensitive => false

  include Searchable

  ## rdoc should be used for all of these model methods, indenting is also off, should be two spaces
 def as_indexed_json(options={})
  {
    "content_rating" => content_rating,
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
   suggestions = Video.search("#{setup_multi_term_search(video.theme)}^10 OR #{video.content_rating} OR #{setup_multi_term_search(actors)}^5")[0, 4]
   if suggestions.nil?
     suggestions = Video.search("*")[0, 4]
   end
   suggestions.each {|s| suggestions.delete(s) if s.title.include?(video.title)}
   return suggestions[0, 3]
 end

 def self.custom_search(search_string, search_fields)
   return all if search_string.blank?
   if search_fields.blank?
     # doesn't look like this variable is being used, no need to assign it to one
     videos = Video.where("title ~* ?", search_string)
   else
     videos = Video.where("#{search_fields.pop} ~* ?", search_string)
     search_fields.each do |field|
       videos = videos.or(Video.where("#{field} ~* ?", search_string))
     end
     ## probably don't need the return here, ruby should just return last line it reaches from whichever condition it meets
     return videos
   end
 end

end

Video.import force: true
