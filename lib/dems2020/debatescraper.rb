require "./lib/environment"

class DebateScraper
  attr_accessor :debates

  def initialize
    @debates = []
  end

  def find_debates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Important_dates_in_the_2020_presidential_race#Democratic_presidential_primary_debates"))
    doc.css("div.mw-content-ltr table td").each_with_index do |table_cell, i|
      if table_cell.text.include? "debate"
        debate = table_cell.text.strip
        date = doc.css("div.mw-content-ltr table td")[i+1].text.strip
        @debates << "#{debate} on #{date}"
      end
    end
    @debates
  end

end
