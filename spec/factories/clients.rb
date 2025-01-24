FactoryBot.define do
  factory :client do
    name { "MyString" }
    dob { "2025-01-24" }
    last_appointment { "2025-01-24" }
    next_appointment { "2025-01-24" }
    notes { "MyText" }
    user { nil }
  end
end
