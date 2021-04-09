require 'open-uri'
require 'nokogiri'
require_relative '../lib/scraper'
require_relative '../lib/display'
# rubocop:disable Style/MixinUsage:
include Display
# rubocop:enable Style/MixinUsage:
url = 'https://www.exportleftovers.com/collections/polo-republica'
# rubocop:disable Security/Open:
document = URI.open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)
data1 = data(parsed_content)
data1.each do |row|
  puts "title = #{row[:title]}"

  puts "Producr_Id = #{row[:id]}"
  puts "Is_Tainted? = #{row[:tainted]}"
  puts "Number_of_reviews = #{row[:reviews]}"
  puts "Price = #{row[:price].strip.delete('/n')}"
  puts '-----------------------------------------------------------'
end
# rubocop:enable Security/Open:
