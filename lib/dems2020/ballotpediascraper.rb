require "./lib/environment"

class BallotpediaScraper

  def self.candidates # https://ballotpedia.org/Presidential_candidates,_2020
    candidates = []
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Presidential_candidates,_2020"))
    i = 0
    until candidates.include? "Andrew Yang"
      candidates << doc.css("div.mobile-columns a")[i].text
      i+=1
    end
    candidates.each do |name|
      if name[0].match(/[A-Z]/) == nil
        candidates.delete(name)
      end
    end
  #  binding.pry
  end

  def self.dates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race scrollable-table-container
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Presidential_candidates,_2020"))
    binding.pry
    # doc.css("div.mw-content-ltr table div.bp-dropdown-menu")
    # doc.css("div.mw-content-ltr table").css("div.scrollable-table-container")
    doc.css("div.mobile-columns a")[i].text
    upcoming_debates = ["First debate - July 1", "Second Debate - August 1"]
  end

end
