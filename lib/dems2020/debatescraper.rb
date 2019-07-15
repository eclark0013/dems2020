require "./lib/environment"

class Dems2020::DebateScraper
  attr_accessor :name, :date, :debates

  def self.get_debates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race
    @debates = []
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Important_dates_in_the_2020_presidential_race#Democratic_presidential_primary_debates"))
    doc.css("div.mw-content-ltr table td").each_with_index do |table_cell, i|
      if table_cell.text.include? "debate"
        @name = table_cell.text.strip
        @date = doc.css("div.mw-content-ltr table td")[i+1].text.strip
        @debates << Dems2020::Debates.new(@name, @date)
      end
    end
    @debates
  end

end
