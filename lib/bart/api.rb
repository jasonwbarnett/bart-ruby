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

    def self.etd(origin: "ALL", platform: nil, direction: nil)
      res = conn.get do |req|
        req.url "/api/etd.aspx"
        req.params["cmd"] = "etd"
        req.params["orig"] = origin
        req.params["plat"] = platform if platform
        req.params["dir"] = direction if direction
      end

      case res.status
      when 200
        if origin == "ALL"
          res.body["root"]["station"]
        else
          res.body["root"]["station"].first["etd"]
        end
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
