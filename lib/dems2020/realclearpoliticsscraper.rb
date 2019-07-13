class RCPScraper
  attr_accessor :result

  def initialize
    @result = []
  end

  def result
    @result
  end

  def polling_data # https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html
    doc = Nokogiri::HTML(open("https://www.realclearpolitics.com/epolls/2020/president/us/2020_democratic_presidential_nomination-6730.html"))
    # doc.css("div#polling-data-rcp th.diag").first.text.strip
    people = []
    doc.css("div#polling-data-rcp th.diag").each do |person|
      people << person.text.strip
    end
    binding.pry

    numbers = []
    doc.css("div#polling-data-rcp tr.rcpAvg td").each_with_index[2]
    @result = {
      Person_1: "30",
      Person_2: "25"
    }
  end

end
