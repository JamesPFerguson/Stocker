require 'nokogiri'
require 'pry'
require 'open-uri'
require_relative './stock.rb'

class Scraper



  def self.full_scrape
    self.scrape_from_main
    Stock.all.sort!{|x, y| x.number <=> y.number}
    self.scrape_valuation
    self.scrape_ownership
    self.scrape_performance
    Stock.all.each do {|stock|
      puts stock.name
      puts stock.number
      puts stock.perf_week
      puts stock.perf_month
      puts stock.perf_quarter
      puts stock.perf_half
      puts stock._perf_year
      puts "===================================="
      puts "===================================="
    }
  end

  #scrapes the first page for key stock information
  def self.scrape_from_main

    stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=111&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=4&o=-perf26w"))

    #goes through each dark table row and retrieves the stock
    stocks.css(".table-dark-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.create #creates a new stock for each time column loops
      columns.css(".screener-body-table-nw").each do |column|
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
        end
        i += 1
      end
    end

    #scrapes the light row
    stocks.css(".table-light-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.create #creates a new stock for each time column loops
      columns.css(".screener-body-table-nw").each do |column|
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
        end #ends case
        i += 1
      end #ends row each
    end #ends complete each
  end

  #scrapes valuation stats
  def self.scrape_valuation

    stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=121&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=4&o=-perf26w"))

    index = 0 #index for stocks array
    stocks.css(".table-dark-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assigns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 7
          stock.ps_ratio = text
        when 10
          stock.pfcf_ratio = text
        when 11
          stock.eps_growth = text
        when 13
          stock.five_y_eps = text
        end #ends case statement
        i += 1
      end #ends column loop
      index += 2 #increments the index twice so that it only hits dark rows
    end #ends row loop

    index = 1 #index for stocks array that only hits light rows
    #scrapes the light row
    stocks.css(".table-light-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assigns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 7
          stock.ps_ratio = text
        when 10
          stock.pfcf_ratio = text
        when 11
          stock.eps_growth = text
        when 13
          stock.five_y_eps = text
        end #ends case statement
        i += 1
      end #ends the column loop
      index += 2 #increments the index so that it only hits light rows
    end #ends light row loop

  end #ends the valuation scrape method

  def self.scrape_ownership
    stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=131&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=4&o=-perf26w"))

    index = 0 #index for stocks array
    stocks.css(".table-dark-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assigns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 5
          stock.float = text
        when 6
          stock.insider_owns = text
        when 7
          stock.insider_trans = text
        when 8
          stock.inst_owns = text
        when 9
          stock.inst_trans = text
        when 10
          stock.float_short = text
        when 12
          stock.avg_vol = text
        end #ends case statement
        i += 1
      end #ends column loop
      index += 2 #increments the index twice so that it only hits dark rows
    end #ends row loop

    index = 1 #index for stocks array that only hits light rows
    #scrapes the light row
    stocks.css(".table-light-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assignns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 5
          stock.float = text
        when 6
          stock.insider_owns = text
        when 7
          stock.insider_trans = text
        when 8
          stock.inst_owns = text
        when 9
          stock.inst_trans = text
        when 10
          stock.float_short = text
        when 12
          stock.avg_vol = text
        end #ends case statement
        i += 1
      end #ends the column loop
      index += 2 #increments the index so that it only hits light rows
    end #ends light row loop

  end #ends the valuation scrape method




  def self.scrape_performance
    stocks = Nokogiri::HTML(open("https://finviz.com/screener.ashx?v=141&f=fa_pe_low,fa_pfcf_low,fa_ps_u3,geo_usa,ta_perf_13wup,ta_perf2_4wup&ft=3&o=-perf26w"))

    index = 0 #index for stocks array
    stocks.css(".table-dark-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assigns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 3
          stock.perf_week= text
        when 4
          stock.perf_month = text
        when 5
          stock.perf_quarter = text
        when 6
          stock.perf_half = text
        when 7
          stock.perf_year = text
        end #ends case statement
        i += 1
      end #ends column loop
      index += 2 #increments the index twice so that it only hits dark rows
    end #ends row loop

    index = 1 #index for stocks array that only hits light rows
    #scrapes the light row
    stocks.css(".table-light-row-cp").each do |columns|
      i = 1 #index for columns loop
      stock = Stock.all[index] #assignns the current stock in the row to the stock variable
      columns.css(".screener-body-table-nw").each do |column|
        text = column.text
        #This case statement assigns the appropriate attribute to a stock depending on which iteration of the loop we are in.
        case i
        when 3
          stock.perf_week= text
        when 4
          stock.perf_month = text
        when 5
          stock.perf_quarter = text
        when 6
          stock.perf_half = text
        when 7
          stock.perf_year = text
        end #ends case statement
        i += 1
      end #ends the column loop
      index += 2 #increments the index so that it only hits light rows
    end #ends light row loop

  end

end


  Scraper.full_scrape
