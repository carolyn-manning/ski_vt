require_relative 'snow_report.rb'
require_relative 'scraper.rb'

class Cli 

    def welcome
        puts  "Hello"
        Scraper.new.scrape_page
    end

    def all
        SnowReport.all 
    end

    def call
        puts "Choose a mountain" 
        list_mountains
    end 

    def list_mountains
        SnowReport.all_mountains.each_with_index {|mountain,  i| puts "#{i}. #{mountain}"}
    end

    #def count_mountains 
     #   SnowReport.all_mountains.count
    #end

    def choose_mountain(input)
        mountain = SnowReport.all_mountains[input - 1]
        SnowReport.all.each do |report| 
            if mountain == report.mountain
                puts "#{report.mountain}"
            end
        end 
    end 
binding.pry
end 

Cli.new.welcome