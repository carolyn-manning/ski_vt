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
            trails_open = resort.css(".trail_info .cond_info_value").text
            lifts_open = resort.css(".lift_info .cond_info_value").text
            surface = resort.css(".surface_cond .cond_info_value").text
            status = resort.css(".res_cond_status .cond_info_value").text
            last_snow = resort.css(".last_snow .cond_info_value").text
            base = resort.css(".base_item .cond_info_value").text
            24_hour_snow = resort.css(".hr_24 .cond_info_value").text
            48_hour_snow = resort.css(".hr_48 .cond_info_value").text
            report_link = resort.css(".cond_buttons :first-child").attribute("href").value
            tickets_link = resort.css(".cond_buttons :nth-child(3)").attribute("href").value
        end 
        binding.pry
    end 

end 
Scraper.new.scrape_page