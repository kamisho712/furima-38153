FactoryBot.define do
  factory :item do
    name                { Faker::Lorem.characters(number: 40, min_alpha: 1) }
    description         { Faker::Lorem.characters(number: 1000, min_alpha: 1) }
    category_id         { Faker::Number.between(from: 2, to: 11) }
    item_condition_id   { Faker::Number.between(from: 2, to: 7) }
    delivery_charge_id  { Faker::Number.between(from: 2, to: 3) }
    prefecture_id       { Faker::Number.between(from: 2, to: 48) }
    delivery_day_id     { Faker::Number.between(from: 2, to: 4) }
    price               { Faker::Number.between(from: 300, to: 9999999) }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
