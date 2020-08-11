FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.initials(number: 2)}
    email                 {Faker::Internet.free_email}
    password              {Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    first_name            {"太郎"}
    family_name           {"山田"}
    furigana_first        {"タロウ"}
    furigana_family       {"ヤマダ"}
    birthday              {"2000-01-01"}

    

  end
end