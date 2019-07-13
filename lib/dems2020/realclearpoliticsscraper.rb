class RCPScraper
  attr_accessor :result

  def initialize
    @result = {}
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

    numbers = []
    doc.css("div#polling-data-rcp tr.rcpAvg td").each_with_index do |number, index|
      if index<2
      else
        numbers << number.text
      end
    end
    numbers.pop

    number_of_people = people.count

    for i in 0...number_of_people do
      @result[people[i]] = numbers[i]
    end
    @result
    
  end

end
