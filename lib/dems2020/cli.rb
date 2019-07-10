class Dems2020::CLI
  attr_accessor :candidates
  def call
    @candidates = ["Name of 1", "Name of 2", "Name of 3"]
    menu
    input = gets.strip
    # first choice of candidates or race info
    while input == "C" || input == "R" # creates a loop that allows user to continually access a list of candidates or race-info
      if input == "C" # display list of candidates and use @candidates which has already been scraped from ballotbedia
        display_candidates
        manage_candidate_choice
        input = gets.strip
      elsif input == "R"
        display_race_info
        manage_race_info_choice
        input = gets.strip
      else
        puts "uh-oh, how did this happen?"
      end
    end


  end

  def menu
    puts "There are many candidates running for the democratic nomination for president. Would you like to know more about an individual candidate (bio, previous experience) or the race in general (updated list of candidates running, polling numbers). Type C for candidate or R for race. At any time, you may type \"help\" or \"menu\" to return to this menu. When you have deicde who to vote for, you may type in \"exit\"."
  end

  def display_candidates
    puts "List of candidates:"
    @candidates = ["Name of 1", "Name of 2", "Name of 3"]
    @candidates.each_with_index {|name,index| puts "#{index+1}. #{name}"}
    puts "Select a candidate from the list above using the number beside their name."
  end

  def manage_candidate_choice
    input = gets.strip
    until input.to_i.between?(1, @candidates.count)
      puts "Choose from a number in the list above."
      input = gets.strip
    end
    chosen_candidate = @candidates[input.to_i-1]
    puts "wikipedia info of #{chosen_candidate}"
    puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race."
  end

  def display_race_info
    puts "    What would you like to know?
          \"C\" for a list of candidates still in the race
          \"P\" for most recent polling data
          \"D\" for important dates including upcoming debates, primaries and conventions"
  end

  def manage_race_info_choice
    input = gets.strip
    until input == "C" || input == "P" || input == "D"
      puts "Choose from the options below:
        \"C\" for a list of candidates still in the race
        \"P\" for most recent polling data
        \"D\" for important dates including upcoming debates, primaries and conventions"
      input = gets.strip
    end
    if input == "C"
      puts "Here is a list of candidates still in the race"
    elsif input == "P"
      puts "Here is the most recent polling data"
    elsif input == "D"
      puts "Here are some important dates."
    else
      puts "uh-oh, you weren't supposed to see this"
    end
    puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race."
  end



end
