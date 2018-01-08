class Stock

  @@stocks

attr_accessor :ticker, :name, :price, :volume, :market_cap, :industry, :sector, :number, :change, :pe_ratio, :week_perf, :month_perf, :quart_perf, :half_perf, :year_perf

  def initialize
  end

  def self.stocks
    @@stocks
  end

end
