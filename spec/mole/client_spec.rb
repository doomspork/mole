require 'spec_helper'

module Mole
  describe Client do
    class MockTransporter

      def perform(event)
        events << event
      end

      def events
        @events ||= []
      end
    end

    let(:transport) { MockTransporter.new }
    let(:client) { Client.new(transport) }

    describe '#record' do
      before { client.record(:event, foo: 'bar') }
      it 'will transport the event to Orwell' do
        event = transport.events.first
        expect(event.event).to eq :event
        expect(event.details).to include foo: 'bar'
      end
    end
  end
end
