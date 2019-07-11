require_relative "./cli"

class WikipediaScraper

  def self.candidate_info(name)
    # use the name argument to create a URL to scrape
    info =  {
      name: name,
      bio: "They have done things"
    }
  end

end
