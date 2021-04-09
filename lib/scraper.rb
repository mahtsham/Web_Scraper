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


def data
url = "https://www.exportleftovers.com/collections/polo-republica"
@document = URI.open(url)
@content = @document.read
@parsed_content = Nokogiri::HTML(@content) 
@parsed_content
end

