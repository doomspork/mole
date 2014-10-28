module Mole
  class MissingApiTokenError < StandardError
    def initialize(msg = "Missing required API token.")
      super
    end
  end
end
