require_relative "./cli"

class WikipediaScraper
  attr_accessor :name, :underscore_name, :age, :education, :bio, :doc, :info

  def initialize(name)
    @education = []
    @name = name
  end

  def make_underscore_name
    if @name.end_with? "Castro"
      @underscore_name = "Julian_Castro"
    elsif @name == "Steve Bullock"
      @underscore_name = "Steve_Bullock_(American_politician)"
    elsif @name == "Tim Ryan"
      @underscore_name = "Tim_Ryan_(Ohio_politician)"
    else
      @underscore_name = @name.gsub(" ", "_")
    end
  end

  def candidate_info
    # use the name argument to create a URL to scrape
    make_underscore_name
    @doc = Nokogiri::HTML(open("https://en.wikipedia.org/wiki/#{@underscore_name}"))
    find_age
    find_education
    find_bio
    compile_info
  end

  def find_age
    @doc.css("tbody tr td").each do |piece_of_info|
      if piece_of_info.text.include? "(age"
        @age = piece_of_info.text.split("age")[1][1,2]
      end
    end
  end

  def find_education
    @doc.css("tbody tr td a").each do |link|
      if ["niversity", "ollege"].any? {|word| link.text.include? (word)}
        @education << link.text
      end
    end
  end

  def find_bio
    @doc.css("div.mw-parser-output p").each do |paragraph|
      if paragraph.children.first.name == "b"
        @bio = paragraph.text
      end
    end
  end

  def compile_info
    @info =  {
      name: @name,
      age: @age,
      education: @education.join(" and "),
      bio: @bio
    }
    @info
  end


end
