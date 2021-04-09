require_relative '../lib/scraper'
url = "https://www.exportleftovers.com/collections/polo-republica"
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
end
