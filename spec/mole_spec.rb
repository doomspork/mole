require 'spec_helper'

describe Mole do
  context '.config' do
    let(:token) { 'abc' }

    before do
      Mole.config { |c| c.api_token = token }
    end

    subject { Mole.config }

    its(:api_token) { is_expected.to eql token }
  end
end
