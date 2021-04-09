require 'open-uri'
require 'nokogiri'
# rubocop:disable Style/Documentation:
class Scrap
  attr_reader :tittle, :price, :id, :tainted, :reviews

  def initialize
    @tittle = tittle
    @price = price
    @id = id
    @tainted = tainted
    @reviews = reviews
  end
  # rubocop:enable Style/Documentation:

  # rubocop:disable Security/Open:
  def data
    url = 'https://www.exportleftovers.com/collections/polo-republica'
    @document = URI.open(url)
    @content = @document.read
    @parsed_content = Nokogiri::HTML(@content)
    @parsed_content
  end
  # rubocop:enable Security/Open:

  def extract_data
    @parsed_content.css('.collection-matrix').css('.product-wrap').each do |row|
      @tittle = row.css('.product-thumbnail__title').inner_text
      @price = row.css('.money').inner_text
      @id = row.css('.product-thumbnail__title').object_id
      @tainted = row.css('.product-thumbnail__title').tainted?
      @reviews = row.css('.product-thumbnail__review-stars').count
    end
  end
end

# rubocop:disable Style/Documentation:
module Display
  def data(parsed_content)
    arr = []
    parsed_content.css('.collection-matrix').css('.product-wrap').each do |row|
      tittle = row.css('.product-thumbnail__title').inner_text
      price = row.css('.money').inner_text
      id = row.css('.product-thumbnail__title').object_id
      tainted = row.css('.product-thumbnail__title').tainted?
      reviews = row.css('.product-thumbnail__review-stars').count
      arr.push title: tittle, id: id, tainted: tainted, reviews: reviews, price: price
    end
    arr
  end
end
# rubocop:enable Style/Documentation:
