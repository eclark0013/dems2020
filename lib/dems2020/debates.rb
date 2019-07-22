class Dems2020::Debate
  attr_accessor :name, :date

  @@all = []

  def initialize(name, date)
    @@all << self
    @name = name
    @date = date
  end

  def self.all
    if @@all = []
      @@all = Dems2020::DateScraper.new.get_debates
    end
    @@all
  end


end
