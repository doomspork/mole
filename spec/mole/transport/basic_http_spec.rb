require 'spec_helper'

module Mole
  module Transport
    describe BasicHttp do
      let(:event)   { Event.new('channel', 'event', 'identifier') }
      let(:host)    { 'test.orwell.io' }
      let(:plain)   { BasicHttp.new(api_token: token, api_version: version, host: host, port: port) }
      let(:port)    { 8080 }
      let(:token)   { 'abc' }
      let(:version) { '1.33.7' }

      describe '#perform' do
        before do
          body    = JSON.generate(event.to_h)
          headers = { 'ACCEPT' => "application/vnd.orwell.api.json; version=#{version}", 'ORWELL-TOKEN' => token }

          stub_request(:post, "#{host}:#{port}/events")
            .with(body: body, headers: headers)
            .to_return(:status => 200)
        end

        subject { plain.perform(event) }

        it { is_expected.to be_truthy }

        context 'with an invalid token' do
          before do
            stub_request(:post, "#{host}:#{port}/events")
              .to_return(:status => 401)
          end

          it { is_expected.to be_falsey }
        end
      end
    end
  end
end

