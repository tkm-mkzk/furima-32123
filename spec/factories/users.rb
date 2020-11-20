FactoryBot.define do
  factory :user do
    nickname              {"frima太郎"}
    email                 {Faker::Internet.free_email}
    password              {"aaa111"}
    password_confirmation {password}
    first_name            {"太郎"}
    last_name             {"山田"}
    first_name_reading    {"タロウ"}
    last_name_reading     {"ヤマダ"}
    birthday              {"19900101"}
  end
end
