require 'orwell/mole/version'
require 'orwell/mole/config'
require 'orwell/mole/event'
require 'orwell/mole/transporter'
require 'orwell/mole/client'

module Mole
  extend SingleForwardable

  def self.config
    @config ||= Config.new
    yield @config if block_given?
    @config
  end

  def_delegators :config, :logger
  def_delegators :client, :record, :recordings

  private

  def self.client
    @client ||= Client.new(transporter)
  end

  def self.transporter
    @transporter ||= Transporter.new(config.method)
  end
end
