require 'rails_helper'

RSpec.describe TimezoneApi::User, type: :api do
  describe 'POST /api/user/tz' do
    let(:user) do
      create(:user, token: '661e7b11-cd97-419a-b0bc-0c1102979de0')
    end

    before do
      header 'Authorization', "Bearer #{user.token}"
    end

    it 'valid with appropriate timezones' do
      timezones = Array.new(3) { Faker::Address.unique.time_zone }
      response = call_api(timezones: timezones)
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)['timezones_added']).to eq(timezones)
    end

    it 'not valid with empty timezones' do
      timezones = nil
      response = call_api(timezones: timezones)
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['error']).to eq('timezones is empty')
    end
  end
end
