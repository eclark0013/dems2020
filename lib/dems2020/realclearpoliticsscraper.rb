require "./lib/environment"

class Dems2020::RCPScraper
  attr_accessor :doc, :data, :top_candidates, :percentages

  def initialize
    @data = {}
    @top_candidates = []
    @percentages = []
    @doc = Nokogiri::HTML(open("https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html"))
  end

  def get_data # https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html
    get_top_candidates
    get_percentages
    @top_candidates.each_with_index{|c, i| @data[@top_candidates[i]] = @percentages[i]}
    @data
  end

  def get_top_candidates
    doc.css("div#polling-data-rcp th.diag").each do |candidate|
      @top_candidates << candidate.text.strip
    end
    @top_candidates
  end

  def get_percentages
    doc.css("div#polling-data-rcp tr.rcpAvg td").each_with_index do |percentage, index|
      if index<2
      else
        @percentages << percentage.text
      end
    end
    @percentages.pop
    @percentages
  end

end
