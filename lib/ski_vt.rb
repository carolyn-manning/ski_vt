# frozen_string_literal: true


module SkiVt
  class Error < StandardError; end
  # Your code goes here...
end

require_relative 'ski_vt/scraper.rb'
require_relative 'ski_vt/snow_report.rb'
require_relative "ski_vt/version.rb"
require_relative 'ski_vt/cli.rb'

require 'nokogiri'
require 'open-uri'
require 'pry'