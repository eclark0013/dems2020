class CandidateScraper

  def self.candidates # https://ballotpedia.org/Presidential_candidates,_2020
    candidates = []
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Presidential_candidates,_2020"))
    doc.css("div.mobile-columns ul").first.css("li").each do |name_line|
      candidates << name_line.text.gsub(/ \(.*/, "")
    end
    candidates
  end

end
