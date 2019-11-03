# frozen_string_literal: true

require "faraday"
require "faraday_middleware"

class Bart
  class API
    def self.stations
      res = conn.get do |req|
        req.url "/api/stn.aspx"
        req.params["cmd"] = "stns"
      end

      case res.status
      when 200
        res.body["root"]["stations"]["station"]
      end
    end

    def self.departures
      res = conn.get do |req|
        req.url "/api/etd.aspx"
        req.params["cmd"] = "etd"
        req.params["orig"] = abbreviation
      end

      case res.status
      when 200
        res
      end
    end

    def self.get(url:, params: {})
      res = conn.get do |req|
        req.url url
        req.params.merge!(params)
      end

      case res.status
      when 200
        res
      end
    end

    def self.conn
      @conn ||= Faraday.new(url: "https://api.bart.gov/api") do |faraday|
        faraday.params["key"] = "MW9S-E7SL-26DU-VV8V"
        faraday.params["json"] = "y"
        faraday.response :json
        faraday.adapter Faraday.default_adapter
      end
    end
    private_class_method :conn
  end
end
