module Mole
  class Event
    attr_accessor :name, :data, :timestamp

    def initialize(name, data = {})
      @name      = name
      @data      = data
      @timestamp = Time.now.utc.to_i
    end

    def to_h
      {
        name:   name,
        data: data,
        timestamp: timestamp
      }
    end
  end
end
