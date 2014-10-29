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

  def self.channel(name)
    new_client(name)
  end

  def self.track(identifier, name)
    client = new_client(name)
    client.identify(identifier)
    client
  end

  private

  def self.new_client(channel)
    Client.new(channel, self.transporter)
  end

  def self.transporter
    @transporter ||= Transporter.new(config.method)
  end
end
