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
    minor { true }
    phone { Phonelib.parse('1 414-383-1113').full_e164 }
    email { Faker::Internet.email }
    school { Faker::University.name }
    address { Faker::Address.street_address }

    factory :no_phone_minor do
      phone { nil }
    end

    factory :bad_phone_minor do
      phone { 12_345 }
    end

    factory :no_contact_minor do
      phone { nil }
      email { nil }
    end

    factory :bad_email_minor do
      email { 'not an email' }
    end

    factory :no_contact_adult_student do
      minor { false }
      email { nil }
      phone { nil }
    end
  end
end
