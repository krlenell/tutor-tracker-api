

FactoryBot.define do
  factory :student do
    name { Faker::Name.name }
    active { false }
    minor { false }
    phone { Faker::PhoneNumber.phone_number }
    email { Faker::Internet.email }
    school { Faker::University.name }
    address { Faker::Address.street_address }
  end
end
