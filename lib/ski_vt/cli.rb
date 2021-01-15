require_relative 'snow_report.rb'
require_relative 'scraper.rb'


class Cli 

    def welcome
        puts  "Hello! Welcome to the Ski VT gem."
        Scraper.new.scrape_page
        puts "Choose a mountain for today's snow report (Type the corresponsing number)" 
        SnowReport.list_open_mts
    end

    def valid_entry?(input)
        input.to_i > 0 && input.to_i <= SnowReport.open_mts.length 
    end 

    def print_input_report(input)
        SnowReport.open_mts[input.to_i - 1].print_report 
        puts "To view another report, select another number. To view the menu type list. To exit type exit"
    end

    def call
        #input = nil
        #until input == "exit"
            input = gets.strip
            if input == "exit"
                puts "See you next time! "
            elsif input == "list"
                puts "Choose a mountain for today's snow report (Type the corresponsing number)" 
                SnowReport.list_open_mts
                self.call 
            elsif input.to_i > 0 && input.to_i <= SnowReport.open_mts.length 
                print_input_report(input.to_i - 1)
                self.call
            else
                puts "Sorry. That is not a valid entry. Try Again!"
                self.call
            end 
        #end
    end 
    
end
