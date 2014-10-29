module Mole
  class Event
    attr_accessor :channel, :event, :identifier, :details

    def initialize(channel, event, identifier, details = {})
      @channel    = channel
      @event      = event
      @identifier = identifier
      @details    = details
    end

    def to_h
      {
        channel:     channel,
        event:       event,
        identifier:  identifier,
        details:     details
      }
    end
  end
end
