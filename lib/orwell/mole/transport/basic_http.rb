require 'json'
require 'net/http'

module Mole
  module Transport
    class BasicHttp
      attr_reader :host, :port, :token, :version

      def initialize(opts = {})
        @host    = opts[:host]
        @port    = opts[:port]
        @token   = opts[:api_token]
        @version = opts[:api_version]
      end

      def perform(event)
        json     = event_json(event)
        response = post(json)
        success(response)
      end

      private

      def success(resp)
        resp.is_a? Net::HTTPSuccess
      end

      def post(params)
        Net::HTTP.start(host, port) do |http|
          http.post('/events', params, headers)
        end
      end

      def event_json(event)
        JSON.generate(event.to_h)
      end

      def headers
        {
          'accept'       => "application/vnd.orwell.api.json; version=#{version}",
          'orwell_token' => token
        }
      end

    end
  end
end
