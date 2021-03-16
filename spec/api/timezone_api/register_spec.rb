require 'rails_helper'

RSpec.describe TimezoneApi::User, type: :api do
  describe 'POST /api/user/register' do
    it 'valid with appropriate email' do
      email = Faker::Internet.unique.email
      response = call_api(email: email)
      expect(response.status).to eq(201)
      expect(JSON.parse(response.body)['token']).to eq(User.find_by(email: email).token)
    end

    it 'not valid with an empty email' do
      response = call_api(email: nil)
      expect(response.status).to eq(400)
      expect(JSON.parse(response.body)['error']).to eq('email is empty')
    end
  end
end
