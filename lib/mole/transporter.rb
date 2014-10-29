require 'mole/transport/plain'

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
      when :basic
        Transport::BasicHttp.new(config_hash)
      when :sidekiq
        raise NotImplementedError
      else nil
      end
    end

    def config_hash
      @config_has ||= {
        host:     Mole.config.host,
        port:     Mole.config.port,
        token:    Mole.config.api_token,
        version:  Mole.config.api_version
      }
    end

  end
end
