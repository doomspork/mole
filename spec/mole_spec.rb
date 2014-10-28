require 'spec_helper'

describe Mole do
  context '.config' do
    let(:token) { 'abc' }

    before do
      Mole.config { |c| c.api_token = token }
    end

    subject { Mole.config }

    its(:api_token) { is_expected.to eql token }

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
