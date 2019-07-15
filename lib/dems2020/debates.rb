class Dems2020::Debates
  attr_accessor :name, :date

  @@all = []

  def initialize(name, date)
    @@all << self
    @name = name
    @date = date
  end

  def self.all
    if @@all = []
      @@all = Dems2020::DebateScraper.get_debates
    end
    @@all
  end


end
