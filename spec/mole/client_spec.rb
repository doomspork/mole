require 'spec_helper'

module Mole
  describe Client do
    describe '#record' do
      before { Mole.record(:event, foo: 'bar') }

      it 'will transport the event to Orwell' do
        event = Mole.recordings.first
        expect(event.event).to eq :event
        expect(event.details).to include foo: 'bar'
      end
    end

    describe '#recordings' do
      before do
        Mole.record(:event, foo: 'bar')
        Mole.record(:another)
        Mole.record(:event, timestamp: Time.now)
      end

      subject { Mole.recordings }

      it { is_expected.to be_a Array }
      its(:first) { is_expected.to be_a Event }

    end
  end
end
