require_relative "./cli"

class WikipediaScraper

  def self.candidate_info(name)
    # use the name argument to create a URL to scrape
    name = "Joe Biden"
    name.gsub(" ", "_")
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{name}"))
    info =  {
      name: name,
      bio: "They have done things"
    }
  end

  def name_space_to_underscore(name)



end
