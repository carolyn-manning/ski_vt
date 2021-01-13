require_relative 'snow_report.rb'
require_relative 'scraper.rb'


class Cli 

    def welcome
        puts  "Hello! Welcome to the Ski VT gem."
        Scraper.new.scrape_page
    end

    def call
        puts "Choose a mountain for today's snow report (Type the corresponsing number)" 
        list_mountains
    end 

    def list_mountains
        SnowReport.all_mountains.each_with_index {|mountain,  i| puts "#{i}. #{mountain}"}
    end

    #def count_mountains 
    #    SnowReport.all_mountains.count
    #end

    def choose_mountain
        input = gets.strip
        if input.to_i >= 0 && input.to_i <= SnowReport.all_mountains.length 
            mountain = SnowReport.all_mountains[input.to_i]
            SnowReport.all.each do |report| 
                if mountain == report.mountain 
                    if report.status == "Open"
                        puts "#{report.mountain} is #{report.status}! Today's snow report is below."
                        puts "Trails Open: #{report.trails_open}"
                        puts "Lifts Open: #{report.lifts_open} "
                        puts "Surface: #{report.surface}"
                        puts "Base: #{report.base}"
                        puts ""
                        puts "Snowfall ---------"
                        puts "24 HR #{report.day_snow}"
                        puts "48 HR #{report.two_day_snow}"
                        puts "This report was #{report.last_update}. For the full snow report, click below!" 
                        puts "#{report.report_link}"
                    elsif report.status.include?("Reopen")
                        puts "#{report.mountain} will #{report.status}! Today's snow report is below."
                        puts "Base: #{report.base}"
                        puts ""
                        puts "Snowfall ---------"
                        puts "24 HR #{report.day_snow}"
                        puts "48 HR #{report.two_day_snow}"
                        puts "This report was #{report.last_update}. For the full snow report, click below!" 
                        puts "#{report.report_link}"
                    else 
                        puts "Sorry #{report.mountain} is closed."
                    end 
                end
            end
        else 
            puts "Invalid Response" 
            choose_mountain
        end
    end 

    def continue
        puts "To view another report, select another number. To view the menu type list. To exit type exit"
        input = gets.strip
        until input == "exit"
        end 
    end 

end 
