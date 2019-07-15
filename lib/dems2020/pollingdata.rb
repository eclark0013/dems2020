class Dems2020::PollingData
  attr_accessor :candidate # candidate is the actual candididate object of the candidate class

  @@all = []

  def initialize(name, percentage)
    @@all << self
    @candidate = find_candidate(name)
    @candidate.percentage = percentage
  end

  def find_candidate(name)
    Dems2020::Candidate.all.select {|c| c.name.include? name}[0]
  end

  def self.all
    if @@all = []
      @@all = Dems2020::RCPScraper.new.get_data
    end
    @@all
  end

end
