require 'net/http'
require 'json'

def apiTag(movie_id)
  f = (/^tt/.match(movie_id).nil? ? "t" : "i");
  api_tag = "http://www.omdbapi.com/?#{f}=#{movie_id}&apikey=da4134f5"
end  

def poster(image)
  image == "N/A" ? "noimage.png" : image  
end

def movieData(imdb_id)

  apiData = JSON.parse(Net::HTTP.get(URI(apiTag(imdb_id))))

  movieDataHash = apiData["Response"] == "False" ? {title: "false"} : 
                  {title:             apiData["Title"].to_s,
                   content_rating:    apiData["Rated"].to_s,
                   genre:             apiData["Genre"].to_s,
                   description:       apiData["Plot"].to_s,
                   actors:            apiData["Actors"].to_s,
                   release_date:      apiData["Released"].to_s.split.last,
                   stars:             apiData["imdbRating"].to_s,
                   thumbnail:         poster(apiData["Poster"].to_s)}
end
