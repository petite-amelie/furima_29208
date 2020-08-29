FactoryBot.define do
  factory :item do
    name                  {Faker::Name.initials(number: 2)}
    price                 {Faker::Number.number(digits: 5)}
    introduction          {Faker::Dessert.flavor}
    category_id           {Faker::Number.between(from: 2, to: 11)}
    item_condition_id     {Faker::Number.between(from: 2, to: 7)}
    postage_type_id       {Faker::Number.between(from: 2, to: 3)}
    prefecture_id         {Faker::Number.between(from: 2, to: 48)}
    preparation_id        {Faker::Number.between(from: 2, to: 4)}
    user_id               {Faker::Number.between(from: 100, to: 200)}
  end
end
