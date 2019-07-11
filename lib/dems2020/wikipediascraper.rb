require_relative "./cli"

class WikipediaScraper

  def self.candidate_info(name)
    # use the name argument to create a URL to scrape
    age = nil
    if name.end_with? "Castro"
      name = "Julian Castro"
    end
    undersore_name = name.gsub(" ", "_")
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{undersore_name}"))

    # doc.css("tbody tr td")[23].text.split("age")[1,2]
    # doc.css("tbody tr td")[23].text.include? "age&nbsp;"
    # doc.css("tbody tr td")[23].text.include? "age"
    # doc.css("tbody tr td")[23].text.split("age")[1][1,2]
    doc.css("tbody tr td").each do |piece_of_info|
      if piece_of_info.text.include? "(age"
        age = piece_of_info.text.split("age")[1][1,2]
      end
    end
    info =  {
      name: name,
      age: age
    }
    info
  end



end
