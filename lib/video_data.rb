require 'net/http'
require 'json'

# rdoc for all of these
def apiTag(movie_id)
  f = (/^tt/.match(movie_id).nil? ? "t" : "i");
  api_tag = "http://www.omdbapi.com/?#{f}=#{movie_id}&apikey=da4134f5"
end

def poster(image)
  image == "N/A" ? "noimage.png" : image
end

def rating(content = "N/A")
  content == "N/A" ? "not-rated" : content
end

def preprocess(content = "N/A")
  content == "N/A" ? "no description available" : content
end

def movie_data(imdb_id)

  apiData = JSON.parse(Net::HTTP.get(URI(apiTag(imdb_id))))

  # doesn't look like this variable is ever being used no need to assign
  movieDataHash = apiData["Response"] == "False" ? {title: "false"} :
                  {title:             apiData["Title"].to_s,
                   content_rating:    rating(apiData["Rated"]).to_s,
                   theme:             preprocess(apiData["Genre"]).to_s,
                   description:       preprocess(apiData["Plot"]).to_s,
                   actors:            preprocess(apiData["Actors"]).to_s,
                   release_date:      preprocess(apiData["Released"]).to_s.split.last,
                   stars:             preprocess(apiData["imdbRating"]).to_s,
                   thumbnail:         poster(apiData["Poster"].to_s)}
end
