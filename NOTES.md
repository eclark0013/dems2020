Plan your gem, imagine your interface
Start with the project structure
Start with the entry point
force that to build the CLI interface
stub out the interface
start making things real
discvoer objects
program

1. interface

~Puts -
"There are many candidates running for the democratic nomination for president. Would you like to know more about a specific candidate (bio, previous experience) or the race in general (updated list of candidates running, polling numbers). Type C for candidates or R for race. Follow the on-screen prompts. When you have decided who to vote for, you may type in \"exit\"."

  ~if C
    Which candidate would you like to know more about?
      ~Show list of candidates... from https://ballotpedia.org/Presidential_candidates,_2020
      List of candidates:
        Democratic Party:
          1.
          2.
          3.
          ...
      Select a candidate from the list above using the number beside their name.
        ~Depending on the selection show... (scrape wikipedia at this point)
        Bio
        Previous experience
Would you like to know more about a candidate or about the race in general? Type C for candidate or R for race.
  ~if R
    What would you like to know?
      C for a list of candidates still in the race
      P for most recent polling data
      D for important dates including upcoming debates, primaries and conventions
      ~if C
        ~return the same list and give options from original choice to look at the candidates
      ~if P
        ~Scrape data from RealClearPolitics
        Polling Data:
        1. Candidate A - 30%
        2. Candidate B - 25%
        3. Candidate C - 20%
        ...
      ~if D
        ~ list of upcoming debates from https://ballotpedia.org/Important_dates_in_the_2020_presidential_race
        ~ list of primary debates hard-coded
        ~ list of convention dates hard-coded


  when "exit" is typed. "Good luck. May the odds be ever in your favor."
