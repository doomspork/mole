require 'orwell/mole/errors/missing_api_token_error'

module Mole
  class Config
    DEFAULT_HOST = 'api.orwell.io'
    DEFAULT_POST = 80
    DEFAULT_API_VERSION = '0.1.0'

    attr_accessor :api_token
    attr_writer  :api_version, :host, :logger, :method, :port

    def api_token
      raise MissingApiTokenError unless @api_token
      @api_token
    end

    def api_version
      @api_version || DEFAULT_API_VERSION
    end

    def host
      @host || DEFAULT_HOST
    end

    def log
      @logger || default_logger
    end

    def method
      @method || :basic_http
    end

    def port
      @port || DEFAULT_POST
    end

    def reset!
      @api_token, @api_version, @host, @logger, @method, @port = nil
    end

    private

    def default_logger
      unless @default_logger
        require 'logger'
        @default_logger = Logger.new(STDOUT)
      end
      @default_logger
    end

  end
end
