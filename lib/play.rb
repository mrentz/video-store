require './get_top_5'


top5 = Top5.movieData

i = 0
top5.each do |movie|
  puts "title: " + movie[:title]
  puts "content: " + movie[:content].to_s 
  puts "description: " + movie[:description].to_s 
  puts "actors: " + movie[:actors].to_s 
  puts "released: " + movie[:released].to_s
  puts "imdbId: " +movie[:imdbId].to_s
  puts "stars: " + movie[:stars].to_s
  puts "thumbnail: " + movie[:thumbnail].to_s
  
  i += 1
end
                                                                
