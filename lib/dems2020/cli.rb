require "./lib/environment"

class Dems2020::CLI
  attr_accessor :candidates, :input, :chosen_candidate

  def initialize
    @candidates = Dems2020::Candidates.all #@@all from Candidates which scrapes candidates if need be
    @input = nil
  #  binding.pry
  end


  def call
    introduction
    call_without_intro
    send_off
  end

  def call_without_intro
    # first choice of candidates or race info
    @input = gets.strip
    until @input == "exit" # creates a loop that allows user to continually access a list of candidates or race-info but stops if user types exit
      case @input
      when "C" # display list of candidates and use @candidates which has already been scraped from ballotbedia
        display_candidates
        candidate_info_prompt
        manage_candidate_choice
      when "R"
        race_info_prompt
        manage_race_info_choice #returns input
      when "exit"
      else
        invalid_main_menu_choice
      end
    end
  end

  def introduction
    puts "There are many candidates running for the democratic nomination for president. Would you like to know more about a specific candidate (bio, previous experience) or the race in general (updated list of candidates running, polling numbers). Type C for candidates or R for race. Follow the on-screen prompts. When you have decided who to vote for, you may type in \"exit\"."
  end

  def invalid_main_menu_choice # make it red
    puts "Invalid choice. Your choices are:
    Type \"C\" for more information on a specific candidate.
    Type \"R\" for more information on the race in general.
    Type \"exit\" to exit.".colorize(:red)
    @input = gets.strip
  end

  def invalid_race_info_choice
    puts "Invalid choice. Your choices are:
    \"C\" for a list of candidates still in the race
    \"P\" for most recent polling data
    \"D\" for info on upcoming debates".colorize(:red)
    @input = gets.strip
  end

  def invalid_candidate_choice
    puts "Invalid choice. Choose from a number in the list above.".colorize(:red)
    @input = gets.strip
  end

  # candidates methods
  def display_candidates
    puts "\nList of candidates:"
    @candidates.each_with_index {|candidate,index| puts "#{index+1}. #{candidate.name}"} #name becomes candidate.name
  end

  def candidate_info_prompt
    puts "\nSelect a candidate from the list above using the number beside their name for more information."
    @input = gets.strip
  end

  def manage_candidate_choice
    until @input.to_i.between?(1, @candidates.count)
      invalid_candidate_choice
    end
    @chosen_candidate = @candidates[@input.to_i-1]
    display_candidate_info
    main_menu_prompt
    @input = gets.strip # gets choice for main menu of C, R, or exit
  end

  def display_candidate_info
    puts "\n"
    @chosen_candidate.info.each do |category, info| #@chosen_candidate is an instance of the candidate class created in #manage_candidate_choice
      puts "#{category.capitalize}: #{info}"
    end
    puts "\n"
  end

  # race methods
  def race_info_prompt
    puts "What would you like to know?
    \"C\" for a list of candidates still in the race
    \"P\" for most recent polling data
    \"D\" for info on upcoming debates"
    @input = gets.strip
  end

  def manage_race_info_choice
    until @input == "exit" || @input == "C" || @input == "R" # creates a loop that allows user to exit or choose C for info on a specific candidate
      case @input # double case here?
        when "C"
          display_candidates
          candidate_info_prompt
          manage_candidate_choice
        when "P"
          display_polling_info
          main_menu_prompt
          @input = gets.strip # gets choice for main menu of C, R, or exit
        when "D"
          display_debate_info
          main_menu_prompt
          @input = gets.strip # gets choice for main menu of C, R, or exit
        when "exit"
      else
        invalid_race_info_choice
      end
    end
  end

  def display_debate_info
    puts "\nPrimary debates:"
    Dems2020::Debates.all.each do |debate|
      puts "#{debate.name} on #{debate.date}"
    end
    puts "\n"
  end

  def display_polling_info
    puts "\nCurrent polling averages via RealClearPolitics:"
    Dems2020::PollingData.all.each do |candidate, percentage|
      puts "#{candidate}: #{percentage}%"
    end
    puts "\n"
  end

  def main_menu_prompt
    puts "Would you like to know about another candidate or about the race in general? Type C for candidate or R for race. Or \"exit\""
  end

  def send_off
    puts "Good luck. May the odds be ever in your favor."
  end


end
