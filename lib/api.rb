require 'net/http'
require 'json'
require_relative 'stars'

class Top5
  
  def self.getImdbIds
    imdbIdElement = 4 #strip the imDb ID from the movie's url
                      #(Haven't figured out any other way of doing it)
    imdbIdArray = []
    File.open("lib/top5ImdbVids.txt").readlines.each do |line|
      vid = line.split('/')
      imdbIdArray << vid[imdbIdElement]
    end
    return imdbIdArray
  end

def self.number_of_sstars(score) 
  i = 0
  max_stars = 5
  stars = []
#  total_score = (@top5videos.first[:stars].to_f/2).to_s.split(//)
  total_score = (score.to_f/2).to_s.split(//)
  number_of_whole_stars = total_score[0].to_i-1
  decimal_number_stars = total_score[2].to_i
  while i < max_stars do
    case i
    when 0..number_of_whole_stars
      stars[i] = "fa-star checked"
    when number_of_whole_stars + 1
      stars[i] = decimal_number_stars >= 5 ? "fa-star-half-o checked" : "fa-star"
    else
      stars[i] = "fa-star"
    end
    i += 1
  end
  return stars
end

def self.movieData
    top5 = []
    getImdbIds.each do |id|
      apiTag = "http://www.omdbapi.com/?i=#{id}&apikey=da4134f5"
      apiData = JSON.parse(Net::HTTP.get(URI(apiTag)))
      
      top5Hash = {title: apiData["Title"].to_s,
                  content: apiData["Rated"].to_s,
                  description: apiData["Plot"].to_s,
                  actors: apiData["Actors"].to_s,
                  released: apiData["Released"].to_s,
                  imdbId: apiData["imdbID"].to_s,
                  stars: (apiData["imdbRating"].to_s),
                  thumbnail: apiData["Poster"].to_s}
      
      puts number_of_stars(7.2)
      top5 << top5Hash
    end
    return top5
  end  
end
