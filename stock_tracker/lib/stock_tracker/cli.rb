class StockTracker::CLI

  def call
    StockTracker::Scraper.full_scrape
    puts "Welcome to Stock Tracker"
    self.start
  end

  def start
    puts "Here is a list of 20 stocks that qualify as underpriced based on a value composite. These stocks are listed in order of six month performance."
    puts ""
    self.print_list
    puts "which stock would you like more information on?"
    input = gets.strip_to_i

    stock = StockTracker::Stock.find{input)
  end

  def print_list
    StockTracker::Stock.all.each do |stock|
      puts "#{stock.number} #{stock.name}"
    end
  end

  def print_stock(stock)
    puts "-----------Core Information-----------"
    puts "#{stock.number} #{stock.name}"
    puts "Stock Sector: #{stock.sector} \t\t Stock Industry: #{stock.industry}"
    puts "Market Cap: #{stock.market_cap}"
    puts ""
    puts "-----------Value Metrics-----------"
    puts "P/E ratio: #{stock.pe_ratio}"
    puts "P/S ratio: #{stock.ps_ratio}"
    puts "P/FCF ratio: #{stock.pfcf_ratio}"
    puts "Current Year EPS Growth: #{stock.eps_growth}"
    puts "Past 5 Years Annual EPS Growth: #{stock.eps_growth}"
    puts ""
    puts "-----------Ownership Metrics-----------"
    puts "Float: #{stock.float}"
    puts "Insider Ownership: #{ins_owns}"


end
