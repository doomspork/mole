require 'spec_helper'

module Mole
  describe Event do
    it { is_expected.to respond_to :name }
    it { is_expected.to respond_to :data }
    it { is_expected.to respond_to :timestamp }

    let(:name) { 'name'}
    let(:data) { { foo: 'bar' } }

    subject { Event.new(name, data) }

    its(:name)      { is_expected.to eql name }
    its(:data)      { is_expected.to eql data }
    its(:timestamp) { is_expected.to_not be_nil }

    describe '#to_h' do
      subject { Event.new(name, data).to_h }

      it { is_expected.to include name: name, data: data }
      it { is_expected.to include :timestamp }
    end
  end
end
