class Dems2020::Debate
  attr_accessor :name, :date, :location, :network, :participants

  @@all = []

  def initialize(info)
    @@all << self
    @name = info[0]
    @date = info[1]
    @location = info[2]
    @network = info[3]
    @participants = info[4]
  end

  def self.all
    if @@all = []
      @@all = Dems2020::DateScraper.new.get_debates
    end
    @@all
  end


end
