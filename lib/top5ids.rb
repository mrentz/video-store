File.open("top5ImdbVids.txt").readlines.each do |line|
   vid = line.split('/')
   puts vid[4]
end
