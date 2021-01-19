
class SkiVt::Scraper 

    def scrape_page
        doc = Nokogiri::HTML(open("https://skivermont.com/conditions"))
        doc.css(".alpine_info .resort_conditions").each do |resort|
            new_report = SkiVt::SnowReport.new
            new_report.mountain = mountain(resort)
            new_report.last_update = last_update(resort)
            new_report.trails_open = trails_open(resort)
            new_report.lifts_open = lifts_open(resort)
            new_report.surface = surface(resort)
            new_report.status = status(resort)
            new_report.last_snow = last_snow(resort)
            new_report.base = base(resort)
            new_report.day_snow = day_snow(resort)
            new_report.two_day_snow = two_day_snow(resort)
            new_report.report_link = report_link(resort)
            new_report.tickets_link = tickets_link(resort)
        end
    end

    private

    def mountain(resort)
        resort.css(".name").text
    end

    def last_update(resort)
        update = resort.css(".cond_info > :first-child").text
        update[0] = update[0].downcase
        update
    end

    def trails_open(resort)
        resort.css(".trail_info .cond_info_value").text
    end

    def lifts_open(resort)
        resort.css(".lift_info .cond_info_value").text
    end

    def surface(resort)
        resort.css(".surface_cond .cond_info_value").text
    end

    def status(resort)
        resort.css(".res_cond_status .cond_info_value").text
    end

    def last_snow(resort)
        resort.css(".last_snow .cond_info_value").text
    end

    def base(resort)
        resort.css(".base_item .cond_info_value").text
    end

    def day_snow(resort)
        resort.css(".hr_24 .cond_info_value").text
    end

    def two_day_snow(resort)
        resort.css(".hr_48 .cond_info_value").text
    end

    def report_link(resort)
        resort.css(".cond_buttons :first-child").attribute("href").value if resort.css(".cond_buttons :first-child").attribute("href") != nil
    end

    def tickets_link(resort)
        resort.css(".cond_buttons :nth-child(3)").attribute("href").value if resort.css(".cond_buttons :nth-child(3)").attribute("href") != nil 
    end
      

end 
