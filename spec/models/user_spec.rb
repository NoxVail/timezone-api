require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) do
    create(:user,
           email: 'email@example.com',
           token: '661e7b11-cd97-419a-b0bc-0c1102979de0',
           timezones: %w[Europe/Berlin Europe/Amsterdam Europe/Prague])
  end

  it 'has unique email' do
    user
    user = build(:user, email: 'email@example.com')
    expect(user.valid?).to be false
    expect(user.errors[:email]).to include 'has already been taken'
  end

  it 'has unique token' do
    user
    user = build(:user, token: '661e7b11-cd97-419a-b0bc-0c1102979de0')
    expect(user.valid?).to be false
    expect(user.errors[:token]).to include 'has already been taken'
  end

  it 'is valid with valid attributes' do
    user = create(:user)
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = build(:user, email: nil)
    expect(user).to_not be_valid
  end

  it 'is not valid without a token' do
    user = build(:user, token: nil)
    expect(user).to_not be_valid
  end
end
