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
