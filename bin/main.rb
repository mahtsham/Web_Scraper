require 'open-uri'
require 'nokogiri'
require_relative '../lib/scraper.rb'
include Display
url = "https://www.exportleftovers.com/collections/polo-republica"
document = URI.open(url)
content = document.read
parsed_content = Nokogiri::HTML(content)


