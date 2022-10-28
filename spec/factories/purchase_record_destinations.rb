FactoryBot.define do
  factory :purchase_record_destination do
    Faker::Config.locale = :ja

    post_code          { Faker::Address.zip_code }
    prefecture_id      { Faker::Number.between(from: 2, to: 48) }
    city               { Faker::Address.city }
    address            { Faker::Address.building_number }
    building_name      { Faker::Address.secondary_address }
    phone_number       { Faker::Number.leading_zero_number(digits: 11) }
    token              { 'tok_abcdefghijk00000000000000000' }
  end
end
