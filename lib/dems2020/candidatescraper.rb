# require "./lib/environment"

class Dems2020::CandidateScraper

  def self.candidates # https://ballotpedia.org/Presidential_candidates,_2020
    candidates = []
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Presidential_candidates,_2020"))
    doc.css("div.mobile-columns ul").first.css("li").each do |name_line|
      candidate = name_line.text.gsub(/ \(.*/, "")
      candidates << Dems2020::Candidates.new(candidate)
    end
    candidates
  end

end
