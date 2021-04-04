require 'httparty'
require 'nokogiri'

def scraper
    url = 'https://www.booking.com/searchresults.en-gb.html?label=gen173nr-1FCAEoggI46AdIM1gEaLUBiAEBmAEJuAEZyAEM2AEB6AEB-AELiAIBqAIDuALjiZmDBsACAdICJDZkMzcxZmZmLWViNzEtNGMwNS1iZjc2LTAyNGU2Y2RmOWYyN9gCBuACAQ&lang=en-gb&sid=6dea18d2b42c971536bc53441241775e&sb=1&sb_lp=1&src=index&src_elem=sb&error_url=https%3A%2F%2Fwww.booking.com%2Findex.en-gb.html%3Flabel%3Dgen173nr-1FCAEoggI46AdIM1gEaLUBiAEBmAEJuAEZyAEM2AEB6AEB-AELiAIBqAIDuALjiZmDBsACAdICJDZkMzcxZmZmLWViNzEtNGMwNS1iZjc2LTAyNGU2Y2RmOWYyN9gCBuACAQ%3Bsid%3D6dea18d2b42c971536bc53441241775e%3Bsb_price_type%3Dtotal%26%3B&ss=Murree%2C+Pakistan&is_ski_area=&checkin_year=&checkin_month=&checkout_year=&checkout_month=&group_adults=2&group_children=0&no_rooms=1&b_h4u_keep_filters=&from_sf=1&dest_id=-2769851&dest_type=city&search_pageview_id=4cfa9bf16a3200f7&search_selected=true&is_popular_nearby=1'
    unparsed_page = HttParty.get(url)
    parsed_page = Nokogiri::HTML(unparsed_page)
end
scraper