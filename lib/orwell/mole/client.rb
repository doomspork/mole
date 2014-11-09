module Mole
  class Client

    attr_reader :transporter

    def initialize(transporter)
      @transporter = transporter
    end

    def record(event, details = {})
      event = Event.new(event, details)
      @transporter.perform(event)
    end
  end
end
