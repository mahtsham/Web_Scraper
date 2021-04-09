require 'open-uri'
require 'nokogiri'
class Scrap
  attr_reader :tittle, :price, :id, :tainted, :reviews

  def initialize
    @tittle = tittle
    @price = price
    @id = id
    @tainted = tainted
    @reviews = reviews
  end

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
