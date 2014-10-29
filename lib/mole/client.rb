module Mole
  class Client

    attr_reader :channel, :identifier, :transporter

    def initialize(channel, transporter)
      @channel     = channel
      @transporter = transporter
    end

    def identify(id)
      @identifier = id
    end

    def record(event, *args)
      identifier, details = expand_args(args)
      event = Event.new(channel, event, identifier, details)
      @transporter.perform(event)
    end

    private

    def expand_args(args)
      id, details = args
      if id.is_a?(Hash)
        details = id
        id      = nil
      end
      id = @identifier unless id
      [id, details]
    end
  end
end
