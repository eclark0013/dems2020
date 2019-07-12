require_relative "./cli"

class WikipediaScraper
  attr_accessor :underscore_name

  def candidate_info(name)
    # use the name argument to create a URL to scrape
    age = nil
    education = []
    @underscore_name = nil
    if name.end_with? "Castro"
      @underscore_name = "Julian_Castro"
    elsif name == "Steve Bullock"
      @underscore_name = "Steve_Bullock_(American_politician)"
    else
      @underscore_name = name.gsub(" ", "_")
    end
    #binding.pry
    doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{@underscore_name}"))
    # doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{name.gsub(" ", "_")}"))
    # doc.css("tbody tr td")[23].text.split("age")[1,2]
    # doc.css("tbody tr td")[23].text.include? "age&nbsp;"
    # doc.css("tbody tr td")[23].text.include? "age"
    # doc.css("tbody tr td")[23].text.split("age")[1][1,2]
    doc.css("tbody tr td").each do |piece_of_info|
      if piece_of_info.text.include? "(age"
        age = piece_of_info.text.split("age")[1][1,2]
      end
    end

    doc.css("tbody tr td a").each do |link|
      if ["niversity", "ollege"].any? {|word| link.text.include? (word)}
        education << link.text
      end
    end
      # doc.css("tbody tr td")[19].text.split(")").each {|uni|  unis << uni + ")"}
#      if ["niversity", "ollege"].any? {|word| piece_of_info.text.include? (word)}
#        piece_of_info.text.split(")").each do |school|
#          education << school + ")"
#        end
#      end
    binding.pry
    bio = "doing stuff"
    info =  {
      name: name,
      age: age,
      education: education.join(" and "),
      bio: bio
    }
    info
  end



end
