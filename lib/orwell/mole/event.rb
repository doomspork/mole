module Mole
  class Event
    attr_accessor :event, :details, :timestamp

    def initialize(event, details = {})
      @event      = event
      @details    = details
      @timestamp  = Time.now.utc.to_i
    end

    def to_h
      {
        event:   event,
        details: details,
        timestamp: timestamp
      }
    end
  end
end
