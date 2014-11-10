require 'spec_helper'
require 'sucker_punch/testing/inline'
require 'orwell/mole/transport/sucker_punch'

module Mole
  module Transport
    describe SuckerPunch do
      let(:event)     { Event.new('event') }
      let(:host)      { 'test.orwell.io' }
      let(:port)      { 8080 }
      let(:token)     { 'abc' }
      let(:transport) { SuckerPunch.new(api_token: token, api_version: version, host: host, port: port) }
      let(:version)   { '1.33.7' }

      describe '#perform' do
        before do
          body    = JSON.generate(event.to_h)
          headers = { 'ACCEPT' => "application/vnd.orwell.api.json; version=#{version}", 'CONTENT-TYPE' => 'application/vnd.orwell.api.json', 'ORWELL-TOKEN' => token }

          stub_request(:post, "#{host}:#{port}/events")
            .with(body: body, headers: headers)
            .to_return(:status => 200)
        end

        it 'will asynchronously send the request' do
          any_instance_of(BasicHttp) do |klz|
            mock.proxy(klz).perform(anything)
          end
          transport.perform(event)
        end
      end
    end
  end
end
