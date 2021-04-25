FactoryBot.define do
  factory :tweet do
    content           { Faker::Lorem.sentence }
    image             { nil }
    video             { nil }
    category_id       { 2 }
    condition_id      { 2 }
    baby_age_id       { 2 }
    baby_gender_id    { 2 }
    association :user
  end
end
