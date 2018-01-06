require 'imdbids'
require 'video_data'

class Top5
  def self.data
    top5 = []
    get_movie_Ids.each do |movie_id|
      top5 << movieData(movie_id)
    end
    return top5  
  end  
end
