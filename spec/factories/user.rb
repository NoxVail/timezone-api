FactoryBot.define do
  factory :user, class: User do
    email { Faker::Internet.unique.email }
    token { Faker::Internet.unique.uuid }
    timezones { Array.new(3) { Faker::Address.unique.time_zone } }
  end
end
