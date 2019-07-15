class Dems2020::Debates
  attr_accessor :debates

  @@all

  def initialize(name)
    @@all << self #if we haven't scraped the debates yet, it runs all to make sure that we do that
    @name = name
  end

  def self.all
    if @@all = []
      @@all = Dems2020::DebateScraper.get_debates
    end
    @@all
  end


end
