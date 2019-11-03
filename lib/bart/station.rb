# frozen_string_literal: true

class Bart
  class Station
    def api
      @api ||= Faraday.new(url: "http://api.bart.gov/api") do |faraday|
        faraday.params[:key] = "MW9S-E7SL-26DU-VV8V"
        faraday.params[:json] = "y"
        faraday.response :json
        if false
          faraday.response :logger do |logger|
            logger.filter(/(api_key=)(\w+)/, '\1[REMOVED]')
          end
        end
        faraday.adapter Faraday.default_adapter # make requests with Net::HTTP
      end
    end

    def test
      # http://api.bart.gov/api/etd.aspx?cmd=etd&orig=RICH&key=MW9S-E7SL-26DU-VV8V&json=y
      api.get do |req|
        req.params["cmd"] = "etd"
        req.params["orig"] = "RICH"
      end
    end

    def name; end

    def abbreviation; end
  end
end
