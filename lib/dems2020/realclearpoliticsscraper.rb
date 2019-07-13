require "./lib/environment"

class RCPScraper
  attr_accessor :result, :candidates

  def initialize
    @result = {}
    @candidates = []
    @percentages = []
  end

  def polling_data # https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html
    doc = Nokogiri::HTML(open("https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html"))

    doc.css("div#polling-data-rcp th.diag").each do |candidate|
      @candidates << candidate.text.strip
    end

    doc.css("div#polling-data-rcp tr.rcpAvg td").each_with_index do |percentage, index|
      if index<2
      else
        @percentages << percentage.text
      end
    end
    @percentages.pop

    @candidates.each_with_index{|c, i| @result[@candidates[i]] = @percentages[i]}

    @result
  end
end
