FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_reading    {"タロウ"}
    first_name_reading    {"ヤマダ"}
    bithday               {Faker::Date.backward}
  end
end
