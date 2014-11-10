require 'spec_helper'

module Mole
  describe Event do
    it { is_expected.to respond_to :event }
    it { is_expected.to respond_to :details }
    it { is_expected.to respond_to :timestamp }

    let(:event)      { 'event'}
    let(:details)    { { foo: 'bar' } }

    subject { Event.new(event, details) }

    its(:event)      { is_expected.to eql event }
    its(:details)    { is_expected.to eql details }
    its(:timestamp)  { is_expected.to_not be_nil }

    describe '#to_h' do
      subject { Event.new(event, details).to_h }

      it { is_expected.to include event: event, details: details }
      it { is_expected.to include :timestamp }
    end
  end
end
