require 'nokogiri'
require 'pry'
require 'open-uri'

class Scraper


  def self.scrape_from_main
    stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=111&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=4&o=-perf26w"))

    stocks.css(".table-dark-row-cp").each do |column|
      column
      binding.pry
    end


    binding.pry
  end


end

Scraper.scrape_from_main
