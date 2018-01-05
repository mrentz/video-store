
def number_of_stars(score = "ImdbRating") 
  i = 0
  max_stars = 5
  stars = []
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
