# frozen_string_literal: true

require 'nokogiri'
require 'open-uri'

html_data = open('https://www.cheetay.pk/lahore/').read
nokogiri_object = Nokogiri::HTML(html_data)
tagcloud_elements = nokogiri_object.xpath("//ul[@class='restaurant-content-container']/li/a")

tagcloud_elements.each do |tagcloud_element|
  puts tagcloud_element.text
end
# restaurant-content-container
# restaurant-cell
# restaurants-listing-wrapper
# restaurants-listing-container restaurant-list
