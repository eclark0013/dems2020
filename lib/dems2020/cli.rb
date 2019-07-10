class Dems2020::CLI
  attr_accessor :candidates
  def initialize
    @candidates = ["Name of 1", "Name of 2", "Name of 3"] #scrape candidates here
  end


  def call
    introduction
    call_without_intro
    puts "Good luck. May the odds be ever in your favor."
  end

  def call_without_intro
    input = nil
    # first choice of candidates or race info
    until input == "exit" # creates a loop that allows user to continually access a list of candidates or race-info but stops if user types exit
      input = gets.strip
      case input
      when "C" # display list of candidates and use @candidates which has already been scraped from ballotbedia
        display_candidates
        manage_candidate_choice
      when "R"
        display_race_info
        manage_race_info_choice
      when "exit"
      else
        puts "Your choices are:
          Type \"C\" for more information on a specific candidate.
          Type \"R\" for more information on the race in general.
          Type \"exit\" to exit."
      end
    end
  end

  def introduction
    puts "There are many candidates running for the democratic nomination for president. Would you like to know more about a specific candidate (bio, previous experience) or the race in general (updated list of candidates running, polling numbers). Type C for candidates or R for race. Follow the on-screen prompts. When you have decided who to vote for, you may type in \"exit\"."
  end

  def display_candidates
    puts "List of candidates:"
    @candidates = ["Name of 1", "Name of 2", "Name of 3"]
    @candidates.each_with_index {|name,index| puts "#{index+1}. #{name}"}
    puts "Select a candidate from the list above using the number beside their name."
  end

  def manage_candidate_choice
    input = gets.strip
    until input.to_i.between?(1, @candidates.count) # || input == "exit"
      puts "Choose from a number in the list above."
      input = gets.strip
    end
    #if input != "exit"
    chosen_candidate = @candidates[input.to_i-1]
    puts "wikipedia info of #{chosen_candidate}"
    puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race."
    #end
  end

  def display_race_info
    puts "What would you like to know?
        \"C\" for a list of candidates still in the race
        \"P\" for most recent polling data
        \"D\" for important dates including upcoming debates, primaries and conventions"
  end

  def manage_race_info_choice
    race_input = nil
    until race_input == "exit" # creates a loop that allows user to continually access a list of candidates or race-info but stops if user types exit
      race_input = gets.strip
      case race_input # double case here?
        when "C"
          puts "Here is a list of candidates still in the race"
          puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race. Or \"exit\""
        when "P"
          puts "Here is the most recent polling data"
          puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race. Or \"exit\""
        when "D"
          puts "Here are some important dates."
          puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race. Or \"exit\""
        when "exit"
      else
        puts "Your choices are:
        \"C\" for a list of candidates still in the race
        \"P\" for most recent polling data
        \"D\" for important dates including upcoming debates, primaries and conventions"
      end
    end
  end


end
