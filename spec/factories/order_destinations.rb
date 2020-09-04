FactoryBot.define do
  factory :order_destination do
    post_code                 {'123-4567'}
    prefecture_id             {Faker::Number.between(from: 2, to: 48)}
    city                      {Gimei.address.city.kanji }
    building_name             {Gimei.town.katakana}
    house_number              {"11-11-11"}
    phone_number              {Faker::Number.number(digits: 11)}
    token                     {"1234567890123456789"}
  end
end