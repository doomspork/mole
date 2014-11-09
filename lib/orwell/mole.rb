require 'orwell/mole/version'
require 'orwell/mole/config'
require 'orwell/mole/event'
require 'orwell/mole/transporter'
require 'orwell/mole/client'

module Mole
  def self.config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end

  def self.record(event, *details)
    client.record(event, *details)
  end

  class << self
    alias_method :track, :record
  end

  private

  def self.client
    @client ||= Client.new(transporter)
  end

  def self.transporter
    @transporter ||= Transporter.new(config.method)
  end
end
