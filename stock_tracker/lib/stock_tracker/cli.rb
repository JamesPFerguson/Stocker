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
    self.print_stock(stock)

    puts ""
    puts "Would you like to see information on another stock? Enter Y or N"
    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts ""
      puts "Thanks for using Stock Tracker."
      exit
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
    puts "Today's Volume: #{stock.volume}"
    puts ""
    puts "-----------Value Metrics-----------"
    puts "P/E ratio: #{stock.pe_ratio}"
    puts "P/S ratio: #{stock.ps_ratio}"
    puts "P/FCF ratio: #{stock.pfcf_ratio}"
    puts "Current Year EPS Growth: #{stock.eps_growth}"
    puts "Past 5 Years Annual EPS Growth: #{stock.five_y_eps}"
    puts ""
    puts "-----------Ownership Metrics-----------"
    puts "Float: #{stock.float}"
    puts "Insider Ownership: #{stock.insider_owns}"
    puts "6 Month Insider Ownership Change: #{stock.insider_trans}"
    puts "Institutional Ownership: #{stock.inst_owns}"
    puts "3 Month Institutional Ownership Change: #{stock.inst_trans}"
    puts "Float Short: #{stock.float_short}"
    puts "Average Volume (3 Months): #{stock.avg_vol}"
    puts ""
    puts "-----------Performance Metrics-----------"
    puts "Week Performance: #{stock.perf_week}"
    puts "Month Performance: #{stock.perf_month}"
    puts "Quarter Performance: #{stock.perf_quarter}"
    puts "Six Month Performance: #{stock.perf_half}"
    puts "Year Performance: #{stock.perf_year}"
  end


end
