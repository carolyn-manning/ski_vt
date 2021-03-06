class SkiVt::SnowReport

    attr_accessor :last_update,  
        :lifts_open,
        :trails_open,
        :surface,
        :status,
        :last_snow,
        :base,
        :day_snow,
        :two_day_snow,
        :report_link,
        :tickets_link,
        :mountain

    @@all = []

    def initialize    
       self.save
    end 

    def self.all 
        @@all
    end 

    def save 
        @@all << self
    end 

    def status_open?
        self.status.strip == "Open"
    end 

    def self.open_mts
        self.all.select {|snow_report| snow_report.status_open?}
    end

    def self.list_open_mts
       self.open_mts.each_with_index do |snow_report, i| 
            puts "#{i + 1}. #{snow_report.mountain}"
       end 
    end

    def print_report
        puts ""
        puts "Today's snow report for #{self.mountain} is below."
        puts ""
        puts "Lift and Terrain Status"
        puts "-----------------------------"
        puts "Trails Open: #{self.trails_open}"
        puts "Lifts Open: #{self.lifts_open}" 
        puts "Surface: #{self.surface}"
        puts "Base: #{self.base}"
        puts ""
        puts "Snowfall"
        puts "-----------------------------"
        puts "24 HR: #{self.day_snow}"
        puts "48 HR: #{self.two_day_snow}"
        puts ""
        puts "This report was #{self.last_update}."
        puts "For the full snow report, click below!" unless self.report_link.empty?
        puts "#{self.report_link}" unless self.report_link.empty?
        puts ""
        puts "To buy tickets, click the link below."
        puts "#{self.tickets_link}"
        puts ""
        puts ""
    end 
end 

