FactoryBot.define do
  factory :student do
    name { "Stupid Test Boy" }
    active { false }
    minor { false }
    phone { "1234567" }
    email { "xxxallthekills69@hotmail.com" }
    school { "School of Dumbo" }
    address { "1234 Stinky Lane" }
  end
end
