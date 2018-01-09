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


end
