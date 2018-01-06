require 'net/http'
require 'json'
require 'stars'

  def movieData(imdb_id)
      apiTag = "http://www.omdbapi.com/?i=#{imdb_id}&apikey=da4134f5"
      apiData = JSON.parse(Net::HTTP.get(URI(apiTag)))
      
      movieDataHash = {title: apiData["Title"].to_s,
                  content:         apiData["Rated"].to_s,
                  genre:           apiData["Genre"].to_s,
                  description:     apiData["Plot"].to_s,
                  actors:          apiData["Actors"].to_s,
                  released:        apiData["Released"].to_s,
                  imdbId:          apiData["imdbID"].to_s,
                  stars:           number_of_stars(apiData["imdbRating"].to_s),
                  thumbnail:       apiData["Poster"].to_s}
  end
