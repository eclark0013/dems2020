class Dems2020::Candidates
  attr_accessor :name, :age, :education, :bio, :info # move to Candidate class

  @@all = []

  def initialize(name)
    @@all << self #if we haven't scraped the candidates yet, it runs all to make sure that we do that
    @name = name
  end

  def self.all
    if @@all = []
      @@all = Dems2020::CandidateScraper.candidates
    end
    @@all
  end

  def get_info
    scraper = Dems2020::WikipediaScraper.new(@name)
    @age = scraper.get_age
    @education = scraper.get_education
    @bio = scraper.get_bio
  end

  def info
    get_info
    @info =  {
      name: @name,
      age: @age,
      education: @education.join(", "),
      bio: @bio
    }
  end

end
