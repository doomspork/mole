module Mole
  module Transport
    class Mock
      def initialize(*_)
      end

      def perform(event)
        event
      end
    end
  end
end
