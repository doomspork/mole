require 'sucker_punch' unless defined?(SuckerPunch)

module Mole
  module Transport
    class SuckerPunch

      class AsyncWrapper
        include ::SuckerPunch::Job

        def perform(event, options)
          BasicHttp.new(options).perform(event)
        end
      end

      attr_reader :request_options

      def initialize(opts = {})
        @request_options = opts
      end

      def perform(event)
        AsyncWrapper.new.perform(event, request_options)
      end
    end
  end
end

