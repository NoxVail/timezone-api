require 'rails_helper'

RSpec.describe Organizers::Weather, type: :organizer do
  let(:interactor) { Organizers::Weather.new(params) }
  let(:params) { { token: user.token } }
  let(:user) { create :user, timezones: ['Europe/Kiev'] }
  let(:interactor_result) { Organizers::Weather.(params) }

  before do
    stub_request(:get, 'http://api.openweathermap.org/data/2.5/weather?appid=c4f1f4796a616f4ef48e9fd66e96a6f8&q=Kiev&units=metric')
      .with(
        headers: {
          'Accept' => '*/*',
          'Accept-Encoding' => 'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'User-Agent' => 'Faraday v1.3.0'
        }
      ).to_return(status: 200, body: load_fixture('weather'), headers: {})
  end

  describe '.call' do
    it 'is an organizer' do
      expect(interactor).to be_kind_of(Interactor::Organizer)
    end

    it 'is successful' do
      expect(interactor_result.success?).to be(true)
    end

    it 'should return valid keys' do
      expect(interactor_result.result.first.keys.sort).to eq(JSON.parse(load_fixture('weather'), symbolize_names: true).keys.sort)
    end
  end
end
