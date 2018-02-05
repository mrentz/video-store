class Video < ApplicationRecord
  validates_uniqueness_of :title, :case_sensitive => false

  def self.search(search_string, search_fields)
    results = []
    return all if search_string.blank?
    if search_fields.blank?
      videos = Video.where("title ~* ?", search_string)
    else
      search_fields.each do |field|
        results << Video.where("#{field} ~* ?", search_string)
      end
      videos = "videos = results.first"
      for i in 1..results.size-1
        videos << ".or(results[#{i}])"
      end
      return eval videos
    end
  end
end
