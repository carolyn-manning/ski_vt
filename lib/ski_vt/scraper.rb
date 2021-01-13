#!/usr/bin/env ruby

require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative 'snow_report.rb'

class Scraper 

    def scrape_page
        doc = Nokogiri::HTML(open("https://skivermont.com/conditions"))
        doc.css(".resort_conditions").each do |resort|
            mountain = resort.css(".name").text
            last_update = resort.css(".cond_info > :first-child").text
            trails_open = resort.css(".trail_info .cond_info_value").text
            lifts_open = resort.css(".lift_info .cond_info_value").text
            surface = resort.css(".surface_cond .cond_info_value").text
            status = resort.css(".res_cond_status .cond_info_value").text
            last_snow = resort.css(".last_snow .cond_info_value").text
            base = resort.css(".base_item .cond_info_value").text
            day_snow = resort.css(".hr_24 .cond_info_value").text
            two_day_snow = resort.css(".hr_48 .cond_info_value").text
            report_link = resort.css(".cond_buttons :first-child").attribute("href").value if resort.css(".cond_buttons :first-child").attribute("href") != nil
            tickets_link = resort.css(".cond_buttons :nth-child(3)").attribute("href").value if resort.css(".cond_buttons :nth-child(3)").attribute("href") != nil 

            new_report = SnowReport.new
            new_report.mountain = mountain
            new_report.last_update = last_update 
            new_report.trails_open = trails_open
            new_report.lifts_open = lifts_open 
            new_report.surface = surface 
            new_report.status = status 
            new_report.last_snow = last_snow 
            new_report.base = base 
            new_report.day_snow = day_snow 
            new_report.two_day_snow = two_day_snow 
            new_report.report_link = report_link 
            new_report.tickets_link = tickets_link 
        end
      
    end

end 
