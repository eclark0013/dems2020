class Dems2020::PollingData
  attr_accessor :candidate, :percentage # candidate will be the actual candididate object of the candidate class

  @@all = []

  def initialize(name, percentage)
    @@all << self
    @candidate = find_candidate(name)[0]
    @candidate.percentage = percentage
  end

  def find_candidate(name)
    Dems2020::Candidates.all.select {|c| c.name.include? name}
  end

  def self.all
    if @@all = []
      @@all = Dems2020::RCPScraper.new.get_data
    end
    @@all
  end

end
