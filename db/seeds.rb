# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'httparty'
require 'nokogiri'
require 'json'
require 'pry'
require 'csv'
require 'open-uri'
require 'restclient'
require 'pp'

province_codes = %w[b-british-columbia b-alberta b-saskatchewan b-manitoba b-ontario b-quebec]
CARS_HASH = {
  mazda: { model: %w[mx5 rx7] },
  nissan: { model: %w[silvia 240sx 180sx skyline] },
  toyoa: { model: %w[ae86 supra] },
  mitsubishi: { model: %w[evo 3000gt] },
  honda: { model: %w[civic-type-r civic-sir] }
}.freeze

KIJIJI = 'https://www.kijiji.ca/'

province_codes.each do |province|
  CARS_HASH.each do |make, models|
    models[:model].each do |model|
      page = Nokogiri::HTML(RestClient.get("https://www.kijiji.ca/#{province}/#{make}-#{model}/k0l9006?dc=true"))

      listings = page.css('div.clearfix')

      links = []

      listings.each do |listing|
        puts listing.css('div.title').css('a').text.strip
        links.append listing.css('div.title a').attr('href')
        puts listing.css('div.price').text.strip
        puts listing.css('div.description').text.strip
        puts listing.css('div.location').text.strip
        puts listing.css('div.image img').attr('src')
        puts ''
      end
    end
  end
end

# links.each do |car_link|
#  page = Nokogiri::HTML(RestClient.get("#{KIJIJI}#{car_link}"))
#  puts page
# end

# page = HTTParty.get('https://www.kijiji.ca/b-manitoba/miata/k0l9006?dc=true')
# parse_page = Nokogiri::HTML(page)

# File.write('./modelhtml/miata.html', parse_page)

# miata_array = []

# Pry.start(binding)
# parse_page.css('clearfix')
