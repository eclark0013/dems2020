class Dems2020::Candidate
  attr_accessor :name, :age, :education, :bio, :info

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def self.all
    if @@all = []
      @@all = Dems2020::CandidateScraper.get_candidates
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
