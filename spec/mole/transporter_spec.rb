require 'spec_helper'

module Mole
  describe Transporter do
    context 'with basic http transport' do
      subject { Transporter.new(:basic_http) }
      its(:transport) { is_expected.to be_a Transport::BasicHttp }
    end

    context 'with sidekiq transport' do
      subject { Transporter.new(:sidekiq) }
      its(:transport) { is_expected.to be_a Transport::Sidekiq }
    end

    context 'with sucker punch transport' do
      subject { Transporter.new(:sucker_punch) }
      its(:transport) { is_expected.to be_a Transport::SuckerPunch }
    end

    context 'with an unknown transport' do
      it 'will be Not Implemented' do
        expect { Transporter.new(:random) }.to raise_error NotImplementedError
      end
    end

    describe '#perform' do
      let(:event) { Event.new(:test) }
      let(:transport) { Transport::Mock.new }

      before do
        any_instance_of(Transporter) do |klz|
          stub(klz).lookup(anything) { transport }
        end
      end

      subject { Transporter.new(:mock).perform(event) }

      it { is_expected.to eql event }
    end
  end
end
