# frozen_string_literal: true

FactoryBot.define do
  factory :employee do
    first_name { Faker::Name.first_name }
    last_name { Faker::Name.last_name }
    position { Faker::Company.profession }
    date_of_birth { Faker::Date.birthday }
    employment_date { Faker::Date.backward(days: 1.year.ago.days) }
  end
end
