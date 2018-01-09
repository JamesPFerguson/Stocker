class Stock

  @@stocks = []

# If a reader returns "-" it means the information was not posted on finviz
attr_accessor :ticker, :name, :price, :volume, :market_cap,
:industry, :sector, :number, :change, :pe_ratio,
 :perf_week, :perf_month, :perf_quarter, :perf_half, :perf_year,
 :ps_ratio, :pfcf_ratio, :eps_growth, :five_y_eps, :float, :insider_owns,
  :insider_trans, :inst_owns, :inst_trans, :float_short, :avg_vol,
  :perf_week, :perf_month, :perf_quart, :perf_half, :perf_year



  def initialize
  end

  def self.all
    @@stocks
  end

  def self.create
    Stock.new.tap{|stock| stock.save}
  end

  def save
    self.class.all << self
  end

  def number=(number)
    @number = number.to_i
  end

end
