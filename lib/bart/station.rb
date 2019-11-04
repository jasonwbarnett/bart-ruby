# frozen_string_literal: true

require "bart/api"
require "bart/realtime_estimate"

class Bart
  class Station
    PROPERTIES = %i[
      name
      abbreviation
      latitude
      longitude
      address
      city
      county
      state
      zip_code
    ].freeze

    attr_reader(*PROPERTIES)

    def initialize(abbreviation:, **opts)
      @abbreviation = abbreviation

      PROPERTIES.each do |prop|
        send("#{prop}=", opts[prop]) if opts[prop]
      end
    end

    def realtime_estimates(platform: nil, direction: nil)
      Bart::API.etd(origin: abbreviation,
                    platform: platform,
                    direction: direction).each_with_object([]) do |etd, estimates|
        etd["estimate"].each do |estimate|
          estimates << Bart::RealtimeEstimate.new do |rte|
            rte.from = self
            rte.to = station(abbreviation: etd["abbreviation"])
            rte.minutes = estimate["minutes"]
            rte.platform = estimate["platform"]
            rte.direction = estimate["direction"]
            rte.length = estimate["length"]
            rte.color = estimate["color"]
            rte.hex_color = estimate["hexcolor"]
            rte.bike_flag = estimate["bikeflag"]
            rte.delay = estimate["delay"]
          end
        end
      end
    end

    def station(abbreviation:)
      Bart::Station.all.find { |x| x.abbreviation == abbreviation }
    end

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

    private

    attr_writer(*PROPERTIES)
  end
end
