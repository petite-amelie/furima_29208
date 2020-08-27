FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    first_name            { Gimei.name.first.kanji }
    family_name           { Gimei.name.last.kanji }
    first_name_furigana   { Gimei.name.first.katakana }
    family_name_furigana  { Gimei.name.last.katakana }
    birth_day             { '1993-09-27' }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
  end
end
