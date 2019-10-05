# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'nokogiri'
require 'open-uri'
require 'restclient'
require 'pp'

province_codes = { 'british-columbia' => 'k0l9007',
                   'alberta' => 'k0l9003',
                   'saskatchewan' => 'k0l9009',
                   'manitoba' => 'k0l9006',
                   'ontario' => 'k0l9004' }

cars_hash = {
  mazda: { model: %w[mx5 rx7] },
  nissan: { model: %w[silvia 240sx 180sx skyline] },
  toyoa: { model: %w[ae86 supra] },
  mitsubishi: { model: %w[evo 3000gt] },
  honda: { model: %w[civic-type-r civic-sir] }
}

# For testing
mazda_hash = {
  mazda: { model: %w[mx5 rx7] }
}

# For testing
manitoba_codes = {
  'manitoba' => 'k0l9006'
}

def currency_to_number(currency)
  currency.to_s.gsub(/[$,]/, '').to_f
end

KIJIJI = 'https://www.kijiji.ca'

listing_counter = 0

manitoba_codes.each do |prov, pcode|
  province = Province.find_or_create_by(name: prov)
  mazda_hash.each do |makes, models|
    make = Make.find_or_create_by(name: makes)
    models[:model].each do |mode|
      model = Model.find_or_create_by(name: mode)

      page = Nokogiri::HTML(RestClient.get("#{KIJIJI}/b-#{prov}/#{makes}-#{mode}/#{pcode}?dc=true"))

      listings = page.css('div.clearfix')

      # links = []

      listings.each do |listing|
        price = currency_to_number(listing.css('div.price').text.strip)

        Listing.create(title: listing.css('div.title').css('a').text.strip,
                       make: make,
                       model: model,
                       url: "#{KIJIJI}/#{listing.css('div.title a').attr('href')}",
                       price: price,
                       description: listing.css('div.description').text.strip,
                       location: province,
                       # location: listing.css('div.location').text.strip,
                       image_url: listing.css('div.image img').attr('src'))
      end
    end
  end
end

#   puts listing.css('div.title').css('a').text.strip
#   puts "Link to car: #{KIJIJI}/#{listing.css('div.title a').attr('href')}"
#   puts listing.css('div.price').text.strip
#   puts listing.css('div.description').text.strip
#   puts listing.css('div.location').text.strip
#   puts listing.css('div.image img').attr('src')
#   puts ''
#   listing_counter += 1
