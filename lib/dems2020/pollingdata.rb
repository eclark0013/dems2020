class Dems2020::PollingData
  attr_accessor :data

  @@all

  def initialize(name)
    @@all << self
    @name = name
  end

  def self.all
    if @@all = []
      @@all = Dems2020::RCPScraper.new.get_data
    end
    @@all
  end

end
