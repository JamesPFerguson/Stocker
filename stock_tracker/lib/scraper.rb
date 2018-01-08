require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative './stock.rb'

class Scraper


  def self.scrape_from_main

      stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=111&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=4&o=-perf26w"))
      #goes through each dark table row and retrieves the stock
        stocks.css("#screener-content tr:nth-child(4)").each_with_index do |columns, index|
          if index != 0
            i = 1 #index for columns loop
            stock = Stock.new #creates a new stock for each time column loops
            columns.css(".screener-body-table-nw").each do |column|
            column
            text = column.text
            #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
              case i
              when 1
                stock.number = text
              when 2
                stock.ticker = text
              when 3
                stock.name = text
              when 4
                stock.sector = text
              when 5
                stock.industry = text
              when 7
                stock.market_cap = text
              when 8
                stock.pe_ratio = text
              when 9
                stock.price = text
              when 10
                stock.change = text
              when 11
                stock.volume = text
              end #ends the case statement
              i += 1
            end #ends the row loop
          binding.pry
          Stock.stocks << stock
        end #ends the if statement
        end # ends the table loop
      end # ends the method



end

Scraper.scrape_from_main
