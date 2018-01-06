
def get_movie_Ids
  imdbIdElement = 4 #strip the imDb ID from the movie's url
                    #(Haven't figured out another way of doing it yet)
  imdbIdArray = []
  File.open("lib/top5ImdbVids.txt").readlines.each do |line|
    vid = line.split('/')
    imdbIdArray << vid[imdbIdElement]
  end
  return imdbIdArray
end

