require 'imdbids'
require 'video_data'

# I feel as though most of these methods are only being used in one location making them being in this lib folder and each
# in their own file rather unnessary and would be better served as model, controller, helper methods whichever is most appropriate for their use

## rdoc
class Top5
  def self.data
    top5 = []
    get_movie_Ids.each do |movie_id|
      top5 << movie_data(movie_id)
    end
    # likely don't need this return
    return top5
  end
end
