FactoryBot.define do
  factory :user do
    transient do
      gimei { Gimei.name }
    end
    nickname              { Faker::Name.name }
    email                 { Faker::Internet.free_email }
    password              { '1a' + Faker::Internet.password(min_length: 4) }
    password_confirmation { password }
    family_name           { gimei.family.kanji }
    first_name            { gimei.first.kanji }
    family_name_kana      { gimei.family.katakana }
    first_name_kana       { gimei.first.katakana }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
