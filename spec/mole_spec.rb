require 'spec_helper'

describe Mole do
  before do
    Mole.config.reset!
    event   = Mole::Event.new(:event, foo: 'bar')
    body    = JSON.generate(event.to_h)
    headers = { 'ACCEPT' => 'application/vnd.orwell.api.json; version=0.1.0', 'ORWELL-TOKEN' => 'abc' }

    stub_request(:post, 'api.orwell.io:80/events')
      .with(body: body, headers: headers)
      .to_return(:status => 200)

    Mole.config { |c| c.api_token = 'abc' }
  end

  describe '.record' do
    it 'will transmit the event to Orwell' do
      any_instance_of(Mole::Client) do |client|
        mock(client).record(:event, foo: 'bar')
      end
      Mole.record(:event, foo: 'bar')
    end
  end
end
