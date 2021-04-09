require 'open-uri'
require 'nokogiri'
require_relative '../lib/scraper.rb'
include Display
url = "https://www.exportleftovers.com/collections/polo-republica"
document = URI.open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)
data1 = data(parsed_content)
data1.each do |row|
    puts 'title = ' + row[:title]
    puts "Producr_Id = " + row[:id].to_s
    puts 'Is_Tainted? = ' + row[:tainted].to_s
    puts 'Number_of_reviews = ' + row[:reviews].to_s
    puts 'Price = ' + row[:price].strip.delete('/n').to_s
    puts '-----------------------------------------------------------'
end

