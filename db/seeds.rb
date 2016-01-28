

require "httparty"

API_KEY = ENV["LASTFM_API_KEY"]

## metros that are being defined / selected to make the api request on

GET_METROS_URI = "https://ws.audioscrobbler.com/2.0/?method=geo.getmetros"
COUNTRIES = [
  "United States",
  "Canada",
  "United Kingdom",
  "Mexico",
  "Australia",
  "Japan",
  "Germany",
  "France"
]

## encoding the url response all to lowercase
def urize(value)
  URI.encode(value.downcase)
end

## ensures downcase for all returned data via api
def get_metro_uri(metro)
  GET_METROS_URI + "&country=#{urize(metro)}&api_key=#{API_KEY}&format=json"
end

## request country metro list
def get_metro_list(country)
  value = HTTParty.get get_metro_uri(country)
  value["metros"]["metro"]
end

## grabs metro list
def get_current_metro_list
  metros = []
  COUNTRIES.each do |country|
    metros = metros.concat(get_metro_list(country))
  end
  metros
end

# ------------------------------
## requests metro artists
GET_METRO_ARTISTS_URI = "http://ws.audioscrobbler.com/2.0/?method=geo.getmetroartistchart"

def get_metro_artist_uri(metro)
  GET_METRO_ARTISTS_URI + "&country=#{urize(metro["country"])}&metro=#{urize(metro["name"])}&api_key=#{API_KEY}&format=json"
end

def get_metro_artist_list(metro)

# TODO: Washington DC, Montreal, Quebec and Mexico City all fail...
#   #       Identify the problem!

## attempt to substitute failed cities
  metro["name"].gsub! /Montreal/, "Montréal"
  metro["name"].gsub! /Quebec/, "Québec"

## specifies the failed cities if failed and stores top artists in artist variable
  value = HTTParty.get get_metro_artist_uri(metro)
  if value["topartists"]["artist"].nil?
    puts "  ERROR: Metro artist unavailable."
  else
    value = value["topartists"]["artist"]
    value.map do |artist|
      {
        :name => artist["name"],
        :mbid => artist["mbid"],
        # OPTIMIZE: should we add listeners here?
        :image_uri => artist["image"][2]["#text"]
      }
    end
  end
end

# ------------------------------
## loops through metro list and stores as metro, writes to yml file
metros = get_current_metro_list.map do |metro|
  puts metro["name"]
  metro["artists"] = get_metro_artist_list(metro)
  metro
end

# File.write("db/metros.yml", metros.to_yaml)

# ------------------------------

metros = YAML.load_file("db/metros.yml")


master_artists = []

def master_artists_includes?(master_artists, artist_hash)
  master_artists.any? do |master_artist_hash|
    master_artist_hash[:mbid] == artist_hash[:mbid]
  end
end

def master_artists_find(master_artists, artist_hash)
  master_artists.detect do |master_artist_hash|
    master_artist_hash[:mbid] == artist_hash[:mbid]
  end
end

## converts the metro data to list artists and their metros
# THE OLLLLDDDD SWITCHEROOOOO
puts "", "Performing the old switcheroo"

metros.each do |metro|
  artists = metro["artists"]
  unless artists.nil?
    artists.each_with_index do |artist, i|
      # puts "-> #{metro["name"]} #{metro["country"]} #{i+1}. #{artist[:name]} #{master_artists_includes?(master_artists, artist)}"

      unless master_artists_includes?(master_artists, artist)
        artist[:rankings] = []
        master_artists << artist
      end

      master_artist = master_artists_find(master_artists, artist)
      master_artist[:rankings] << {:rank => i+1, :country => metro["country"], :name => metro["name"]}
    end
  end
end

File.write("db/artists.yml", master_artists.to_yaml)

# --------------------------------

## creates twin db based on yaml file info
master_artists = YAML.load_file "db/artists.yml"

artists = master_artists

puts "", "Saving artists to DB", ""

Twin.destroy_all

artists.each do |artist|
  puts artist[:name] + "..."
  Twin.create(artist)
end

## test user destroy all to make sure duplicates don't happen when seeding
User.destroy_all

User.new(
  first_name: "Cassie",
  last_name: "P",
  email: "123@123.com",
  password: "123",
  password_confirmation: "123"
).save


