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
    let(:client) { Client.new(:test, transport) }

    describe '#identify' do
      before { client.identify(:user) }

      it 'will identify all events' do
        client.record(:event, foo: 'bar')
        events = transport.events
        expect(events.size).to eq 1
        expect(events.first.identifier).to eq :user
      end

    end

    describe '#record' do
      before { client.identify(:user) }

      context 'with identifier' do
        before { client.record(:event, :guest) }

        it 'override the channel identifier' do
          event = transport.events.first
          expect(event.event).to eq :event
          expect(event.identifier).to eq :guest
        end
      end
    end
  end
end
