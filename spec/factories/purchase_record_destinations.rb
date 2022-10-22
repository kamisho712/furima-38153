FactoryBot.define do
  factory :purchase_record_destination do
    Faker::Config.locale = :ja

    user_id            { Faker::Number.between(from: 1, to: 1000) }
    item_id            { Faker::Number.between(from: 1, to: 1000) }
    post_code          { Faker::Address.zip_code }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    city               { Faker::Address.city }
    address            { Faker::Address.building_number }
    building_name      { "" }
    phone_number       { Faker::Number.leading_zero_number(digits: 11) }
    purchase_record_id { Faker::Number.between(from: 1, to: 1000) }
  end
end
