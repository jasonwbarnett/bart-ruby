# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

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

    def initialize(**opts)
      PROPERTIES.each do |prop|
        send("#{prop}=", opts[prop]) if opts[prop]
      end
    end

    def departures
      Bart::API.departures(abbr: abbr)
    end

    private

    attr_writer(*PROPERTIES)
  end
end
