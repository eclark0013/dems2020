require "./lib/environment"

class Dems2020::DateScraper
  attr_accessor :debates, :info

  def get_debates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race
    @debates = []
    @info = []
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Important_dates_in_the_2020_presidential_race#Democratic_presidential_primary_debates"))
#doc.css("div.mw-content-ltr table td").each_with_index do |table_cell, i|
#if table_cell.text.include? "debate"
#name = table_cell.text.strip
#date = doc.css("div.mw-content-ltr table td")[i+1].text.strip
#@debates << Dems2020::Debate.new(name, date)
#end
#end
    doc.css("tr").each_with_index do |tr_page, i|
      if tr_page.text.include? "Democratic primary debate"
        info_array = tr_page.text.split(/\s*\n\s*/)
        info_array.shift
        @debates << Dems2020::Debate.new(info_array)
      end
    end
    @debates
  end


end


