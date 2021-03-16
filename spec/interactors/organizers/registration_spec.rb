require 'rails_helper'

RSpec.describe Organizers::Registration, type: :organizer do
  let(:interactor) { Organizers::Registration.new(params) }
  let(:params) { { email: Faker::Internet.unique.email } }
  let(:interactor_result) { Organizers::Registration.(params) }

  describe '.call' do
    it 'is an organizer' do
      expect(interactor).to be_kind_of(Interactor::Organizer)
    end

    it 'is successful' do
      expect(interactor_result.success?).to be(true)
    end

    it 'should return user\'s token' do
      expect(interactor_result.result).to have_key(:token)
    end
  end
end
