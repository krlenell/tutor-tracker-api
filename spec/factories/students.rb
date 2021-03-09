FactoryBot.define do
  factory :student do
    student_id { "" }
    student_name { "MyText" }
    is_active { false }
    is_minor { false }
    student_phone { 1 }
    student_email { "MyText" }
    school { "MyText" }
    address { "MyText" }
  end
end
