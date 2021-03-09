FactoryBot.define do
  factory :student do
    student_name { "Stupid Test Boy" }
    is_active { false }
    is_minor { false }
    student_phone { "1234567" }
    student_email { "xxxallthekills69@hotmail.com" }
    school { "School of Dumbo" }
    address { "1234 Stinky Lane" }
  end
end
