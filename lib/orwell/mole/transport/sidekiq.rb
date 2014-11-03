require 'sidekiq' unless defined?(Sidekiq)

module Mole
  module Transport
    class Sidekiq
      include ::Sidekiq::Worker

      attr_reader :request_options

      def initialize(opts = {})
        @request_options = opts
      end

      def perform(event)
        Sidekiq.delay.perform_http(event, request_options)
      end

      def self.perform_http(event, opts)
        BasicHttp.new(opts).perform(event)
      end
    end
  end
end


