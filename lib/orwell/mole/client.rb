module Mole
  class Client

    attr_reader :transporter
    attr_reader :recordings

    def initialize(transporter)
      @transporter = transporter
      @recordings = []
    end

    def record(event, details = {})
      event = Event.new(event, details)
      @recordings << event
      transporter.perform(event)
    end
  end
end
