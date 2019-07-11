require "./lib/environment"

class BallotpediaScraper

  def self.candidates # https://ballotpedia.org/Presidential_candidates,_2020

    candidates = ["Person 1", "Person 2", "Person 3"]
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Presidential_candidates,_2020"))
    doc.css("div.mobile-columns a").first.text
    binding.pry
  end

  def self.dates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race
    upcoming_debates = ["First debate - July 1", "Second Debate - August 1"]
  end

end
