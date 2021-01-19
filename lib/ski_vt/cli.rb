class SkiVt::Cli 

    def welcome
        puts ""
        puts  "Hello! Welcome to the Ski VT gem."
        SkiVt::Scraper.new.scrape_page
        puts ""
        puts "Choose a mountain by typing the corresponding number from the menu below for today's snow report." 
        SkiVt::SnowReport.list_open_mts
    end

    def valid_entry?(input)
        input.to_i > 0 && input.to_i <= SkiVt::SnowReport.open_mts.length 
    end 

    def print_input_report(input)
        SkiVt::SnowReport.open_mts[input.to_i - 1].print_report 
        puts "To view another report, select another number. To view the menu, type list. To exit, type exit."
    end

    def call
        input = gets.strip
        if input == "exit"
            puts "See you next time! "
        elsif input == "list"
            puts "Choose a mountain by typing the corresponding number from the menu below for today's snow report."  
            SkiVt::SnowReport.list_open_mts
            self.call 
        elsif self.valid_entry?(input) 
            print_input_report(input)
            self.call
        else
            puts "Sorry. That is not a valid entry. Try Again!"
            self.call
        end 
    end 
    
end
