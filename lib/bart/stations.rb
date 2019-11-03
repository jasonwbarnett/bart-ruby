# frozen_string_literal: true

require "bart/api"
require "bart/station"

class Bart
  class Stations
    def self.all
      @all ||= Bart::API.stations.each_with_object([]) do |station, memo|
        memo << Bart::Station.new(
          name: station["name"],
          abbreviation: station["abbr"],
          latitude: station["gtfs_latitude"],
          longitude: station["gtfs_longitude"],
          address: station["address"],
          city: station["city"],
          county: station["county"],
          state: station["state"],
          zip_code: station["zipcode"]
        )
      end
    end
  end
end
