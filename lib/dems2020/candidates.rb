class Candidates
  attr_accessor :name, :age, :education, :bio, :info # move to Candidate class

  @@all = []

  def initialize(name)
    @@all << self
    @name = name
  end

  def get_info
    scraper = WikipediaScraper.new(@name)
    @age = scraper.get_age
    @education = scraper.get_education
    @bio = scraper.get_bio
  end

  def info
    @info =  {
      name: @name,
      age: @age,
      education: @education.join(", "),
      bio: @bio
    }
  end

end
