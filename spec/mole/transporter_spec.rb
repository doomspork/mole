require 'spec_helper'

module Mole
  describe Transporter do
    context 'with basic http transport' do
      subject { Transporter.new(:basic) }
      its(:transport) { is_expected.to be_a Transport::BasicHttp }
    end

    describe '#perform' do
      class MockTransport
        def perform(event)
          # Do Nothing
        end
      end

      let(:transport) { MockTransport.new }

      before do
        any_instance_of(Transporter) do |klz|
          stub(klz).lookup(anything) { transport }
        end
        mock(transport).perform(anything) { 'delegated' }
      end

      subject { Transporter.new(:mock).perform(nil) }

      it { is_expected.to eql 'delegated' }
    end
  end
end
