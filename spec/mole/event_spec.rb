require 'spec_helper'

module Mole
  describe Event do
    let(:identifier) { 'identifier' }
    let(:channel)    { 'channel' }
    let(:event)      { 'event'}
    let(:details)    { { foo: 'bar' } }

    subject { Event.new(channel, event, identifier, details) }

    its(:identifier) { is_expected.to eql identifier }
    its(:channel)    { is_expected.to eql channel }
    its(:event)      { is_expected.to eql event }
    its(:details)    { is_expected.to eql details }

    describe '#to_h' do
      subject { Event.new(channel, event, identifier, details).to_h }

      it { is_expected.to include channel: channel, event: event, identifier: identifier, details: details }
    end
  end
end
