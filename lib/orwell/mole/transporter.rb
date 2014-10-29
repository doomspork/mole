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
      case transport
      when :basic_http
        Transport::BasicHttp.new(config_hash)
      when :sidekiq
        raise NotImplementedError
      else nil
      end
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
