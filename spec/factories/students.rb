# == Schema Information
#
# Table name: students
#
#  id         :uuid             not null, primary key
#  active     :boolean          default(FALSE), not null
#  address    :string
#  email      :string
#  minor      :boolean          not null
#  name       :string           not null
#  phone      :string
#  school     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
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
