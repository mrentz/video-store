class Video < ApplicationRecord

  validates_uniqueness_of :title, :case_sensitive => false

  def self.search(search_string, search_fields)

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
