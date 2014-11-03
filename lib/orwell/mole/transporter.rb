require 'orwell/mole/transport/basic_http'

module Mole
  class Transporter
    extend Forwardable

    def_delegators :transport, :perform

    attr_reader :transport

    def initialize(transport)
      @transport = lookup(transport)
    end

    private

    def lookup(transport)
      transport = case transport
                  when :basic_http
                    Transport::BasicHttp
                  when :sucker_punch
                    Transport::SuckerPunch
                  when :sidekiq
                    Transport::Sidekiq
                  else
                    raise NotImplementedError
                  end
      transport.new(config_hash)
    end

    def config_hash
      {
        api_token:    Mole.config.api_token,
        api_version:  Mole.config.api_version,
        host:         Mole.config.host,
        port:         Mole.config.port
      }
    end

  end
end
