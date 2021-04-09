# rubocop:disable Security/Open:

require_relative '../lib/scraper'
require_relative '../lib/display'
url = 'https://www.exportleftovers.com/collections/polo-republica'
@document = URI.open(url)

describe Scrap do
  let(:scraper) { Scrap.new }
  describe 'data' do
    it 'Gives the html document to be interacted' do
      expect(scraper.data).to be_a(Nokogiri::HTML::Document)
    end
  end
  describe 'data' do
    it 'To check wheather return value is not equal to string' do
      expect(scraper.data).to_not eql(String)
    end
  end
  describe 'data' do
    it 'To check wheather return value is not equal to string' do
      expect(scraper.data).to_not eql(Integer)
    end
  end
  describe 'data' do
    it 'Gives the html document to be interacted' do
      expect(scraper.data).to be_a(Nokogiri::HTML::Document)
    end
  end
end
describe Display do
  url = 'https://www.exportleftovers.com/collections/polo-republica'
  @document = URI.open(url)
  @content = @document.read
  @parsed_content = Nokogiri::HTML(@content)
  arr = []
  @parsed_content.each do |row|
    row[:title]
    row[:id].to_s
    row[:tainted].to_s
    row[:reviews].to_s
    row[:price].strip.delete('/n').to_s
    arr.push title: tittle, id: id, tainted: tainted, reviews: reviews, price: price
    it 'To check wheather return value is not equal to string' do
      expect(Display.data(parsed_content)).to_output.to_stdout
    end
  end
end
# rubocop:enable Security/Open:
