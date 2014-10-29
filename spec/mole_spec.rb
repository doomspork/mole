require 'spec_helper'

describe Mole do
  before do
    Mole.config.reset!
    event   = Mole::Event.new(:test, :event, :user, foo: 'bar')
    body    = JSON.generate(event.to_h)
    headers = { 'ACCEPT' => 'application/vnd.orwell.api.json; version=0.1.0', 'ORWELL-TOKEN' => 'abc' }

    stub_request(:post, 'api.orwell.io:80/events')
      .with(body: body, headers: headers)
      .to_return(:status => 200)

    Mole.config { |c| c.api_token = 'abc' }
  end

  describe '.channel' do
    subject { Mole.channel(:test) }

    it 'will open a named channel' do
      result = subject.record(:event, :user, foo: 'bar')
      expect(result).to be_truthy
    end
  end

  describe '.track' do
    subject { Mole.track(:user, :test) }

    it 'will open a named channel' do
      result = subject.record(:event, foo: 'bar')
      expect(result).to be_truthy
    end
  end
end
