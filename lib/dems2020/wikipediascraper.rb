require_relative "./cli"

class WikipediaScraper

  def self.candidate_info(name)
    # use the name argument to create a URL to scrape
    age = nil
    education = nil
    undersore_name = name.gsub(" ", "_")
    if name.end_with? "Castro"
      underscore_name = "Julian_Castro"
    elsif "Steve Bullock"
      underscore_name = "Steve_Bullock_(American_politician)"
    end
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{underscore_name}"))

    # doc.css("tbody tr td")[23].text.split("age")[1,2]
    # doc.css("tbody tr td")[23].text.include? "age&nbsp;"
    # doc.css("tbody tr td")[23].text.include? "age"
    # doc.css("tbody tr td")[23].text.split("age")[1][1,2]
    doc.css("tbody tr td").each do |piece_of_info|
      if piece_of_info.text.include? "(age"
        age = piece_of_info.text.split("age")[1][1,2]
      end
  #    if piece_of_info.text.include? "College" || piece_of_info.text.include? "University"
      if 1 == 1
        education = "the university"
      end
    end
    bio = "doing stuff"
  #  binding.pry
    info =  {
      name: name,
      age: age,
      education: education,
      bio: bio
    }
    info
  end



end
