class CandidatesScraper

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
  end

end
