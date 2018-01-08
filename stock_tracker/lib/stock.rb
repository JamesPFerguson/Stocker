class Stock

  @@stocks = []

attr_accessor :ticker, :name, :price, :volume, :market_cap, :industry, :sector, :number, :change, :pe_ratio, :week_perf, :month_perf, :quart_perf, :half_perf, :year_perf

  def initialize
  end

  def self.all
    @@stocks
  end


  def self.find_by_number(number)
    all.find{|stock| stock.number == number}
  end

  def self.find_or_create_by_number(number)
    find_by_name(number) || create(number)
  end

  def self.create(number = nil)
  end

end
