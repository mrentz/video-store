
def getImdbIds
  imdbIdElement = 4 #strip the imDb ID from the movie's url
                    #(Haven't figured out any other way of doing it)
  imdbIdArray = []
  File.open("lib/top5ImdbVids.txt").readlines.each do |line|
    vid = line.split('/')
    imdbIdArray << vid[imdbIdElement]
  end
  return imdbIdArray
end

