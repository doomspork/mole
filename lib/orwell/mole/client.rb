module Mole
  class Client
    attr_reader :transporter
    attr_reader :recordings

    def initialize(transporter)
      @transporter = transporter
      @recordings = []
    end

    def record(name, data = {})
      event = Event.new(name, data)
      @recordings << event
      transporter.perform(event)
    end
  end
end
