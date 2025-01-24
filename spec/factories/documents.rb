FactoryBot.define do
  factory :document do
    name { "MyString" }
    category { "MyString" }
    due_interval { 1 }
    due_date { "2025-01-24" }
    client { nil }
  end
end
