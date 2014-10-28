module Mole
  class Config
    DEFAULT_HOST = 'http://www.orwell.io'
    DEFAULT_POST = 80

    attr_accessor :api_token
    attr_writer :host, :port

    def host
      @host || DEFAULT_HOST
    end

    def port
      @port || DEFAULT_POST
    end
  end
end
