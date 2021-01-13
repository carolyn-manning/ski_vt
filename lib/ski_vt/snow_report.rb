#!/usr/bin/env ruby

class SnowReport

    attr_accessor :last_update, :lifts_open, :trails_open, :surface, :status, :last_snow, :base, :day_snow, :two_day_snow, :report_link, :tickets_link, :mountain

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

   def self.all_mountains
        self.all.collect {|snow_report| snow_report.mountain}
   end 

end 

