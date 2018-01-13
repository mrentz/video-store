require 'net/http'
require 'json'
require 'stars'


def apiTag(movie_id)
  f = (/^tt/.match(movie_id).nil? ? "t" : "i");
  api_tag = "http://www.omdbapi.com/?#{f}=#{movie_id}&apikey=da4134f5"
end  


def movieData(imdb_id)
  apiData = JSON.parse(Net::HTTP.get(URI(apiTag(imdb_id))))
  
  movieDataHash = {title:           apiData["Title"].to_s,
                   content:         apiData["Rated"].to_s,
                   genre:           apiData["Genre"].to_s,
                   description:     apiData["Plot"].to_s,
                   actors:          apiData["Actors"].to_s,
                   released:        apiData["Released"].to_s.split.last,
                   imdbId:          apiData["imdbID"].to_s,
                   stars:           number_of_stars(apiData["imdbRating"].to_s),
                   thumbnail:       apiData["Poster"].to_s}
end
