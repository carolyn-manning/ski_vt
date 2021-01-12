# frozen_string_literal: true

require_relative "ski_vt/version"

module SkiVt
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'scraper.rb'
require_relative 'snow_report.rb'