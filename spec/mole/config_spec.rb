require 'spec_helper'

module Mole
  describe Config do
    context '.config' do
      let(:token) { 'abc' }

      before do
        Mole.config { |c| c.api_token = token }
      end

      subject { Mole.config }

      its(:api_token) { is_expected.to eql token }
      its(:log) { is_expected.to be_a Logger }

      context 'when missing API Token' do
        let(:token) { nil }
        it 'will raise a Missing API Token error' do
          expect { subject.api_token }.to raise_error MissingApiTokenError
        end
      end

      context '#api_version' do
        its(:api_version) { is_expected.to eql '0.1.0' }

        context 'when overridden' do
          before do
            Mole.config {|c| c.api_version = '1.33.7' }
          end

          its(:api_version) { is_expected.to eql '1.33.7' }
        end
      end

      context '#host' do
        its(:host) { is_expected.to eql 'http://www.orwell.io' }

        context 'when overridden' do
          before do
            Mole.config {|c| c.host = 'http://www.something.com' }
          end

          its(:host) { is_expected.to eql 'http://www.something.com' }
        end
      end

      context '#port' do
        its(:port) { is_expected.to eql 80 }

        context 'when overridden' do
          before do
            Mole.config {|c| c.port = 99 }
          end

          its(:port) { is_expected.to eql 99 }
        end
      end

    end
  end
end
