require_relative "./cli"
require "./lib/environment"

class WikipediaScraper
  attr_accessor :underscore_name, :doc

  def initialize(name)
    @education = []
    @name = name
    make_underscore_name
    @doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{@underscore_name}"))
  end

  def make_underscore_name
    if @name.end_with? "Castro"
      @underscore_name = "Julian_Castro"
    elsif @name == "Steve Bullock"
      @underscore_name = "Steve_Bullock_(American_politician)"
    elsif @name == "Tim Ryan"
      @underscore_name = "Tim_Ryan_(Ohio_politician)"
    elsif @name == "John Delaney"
      @underscore_name = "John_Delaney_(Maryland_politician)"
    else
      @underscore_name = @name.gsub(" ", "_")
    end
  end

  def get_age
    @doc.css("tbody tr td").each do |piece_of_info|
      if piece_of_info.text.include? "(age"
        @age = piece_of_info.text.split("age")[1][1,2]
      end
    end
    @age
  end

  def get_education
    @doc.css("tbody tr").each do |tr| #makes a list of each link text under education (including degree designations)
      tr.css("th").each do |th|
        if th.text == "Education"
          tr.css("td a").each do |link|
            @education << link.text
          end
        end
      end
    end
    @education.each_with_index do |school,i|
      if i > 0 && school.length < 5
        @education[i-1] = "#{@education[i-1]} (#{school})" # adds on their BA or JD designation to that school
        @education.delete(school) # removes their BA or JD designation as a separate school
      end
    end
    @education
  end


  def get_bio
    last_name = @name.split(" ").last
    @doc.css("div.mw-parser-output p").each do |paragraph|
      if paragraph.css("b").text.include? last_name
        @bio = paragraph.text.gsub(/\[\d*\]/, "")
      end
    end
    @bio
  end

end
