require 'mole/version'
require 'mole/config'

module Mole
  def self.config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end
end
