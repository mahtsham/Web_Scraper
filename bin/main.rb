# frozen_string_literal: true

require 'httparty'
require 'nokogiri'
require 'byebug'

def scraper
  url = 'https://medium.com/topic/programming'
  unparsed_page = HTTParty.get(url)
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
end
scraper
# restaurant-content-container
# restaurant-cell
# restaurants-listing-wrapper
# restaurants-listing-container restaurant-list
