#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper 

    def scrape_page
        doc = Nokogiri::HTML(open("https://skivermont.com/conditions"))
        doc.css(".resort_conditions").each do |resort|
            name = resort.css(".name").text
            last_update = resort.css(".cond_info > :first-child").text
           # profile_url = "#{student.css("a").attribute("href").value}"
           # students << {name: name, location: location, profile_url: profile_url}
        end 
        binding.pry
    end 

end 
Scraper.new.scrape_page