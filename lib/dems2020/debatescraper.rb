require "./lib/environment"

class DebatesScraper
  attr_accessor :


  def self.dates # https://ballotpedia.org/Important_dates_in_the_2020_presidential_race scrollable-table-container
    doc = Nokogiri::HTML(open("https://ballotpedia.org/Important_dates_in_the_2020_presidential_race#Democratic_presidential_primary_debates"))
    binding.pry
    # doc.css("div.mw-content-ltr table div.bp-dropdown-menu")
    # doc.css("div.mw-content-ltr table td")
    # doc.css("div.mw-content-ltr table").css("p")
    # doc.css("div.mw-content-ltr table").css("td a")[50].text
    doc.css("div.mw-content-ltr table td").each_with_index do |table_cell, i|
      if table_cell.include? "debate"

    doc.css("div.mobile-columns a")[i].text
    upcoming_debates = ["First debate - July 1", "Second Debate - August 1"]
  end

end
