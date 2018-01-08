class Stock

  @@stocks = []

# If a reader returns "-" it means the information was not posted on finviz
attr_accessor :ticker, :name, :price, :volume, :market_cap,
:industry, :sector, :number, :change, :pe_ratio,
 :week_perf, :month_perf, :quart_perf, :half_perf, :year_perf,
 :ps_ratio, :pfcf_ratio, :eps_growth, :five_y_eps, :float, :insider_owns,
  :insider_trans, :inst_owns, :inst_trans, :float_short, :avg_vol



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

  def number=(number)
    @number = number.to_i
  end

end
