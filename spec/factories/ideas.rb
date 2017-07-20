FactoryGirl.define do
  factory :idea do
    sequence :idea do |i|
    "idea#{i}"
    end
    category
    user

    trait :with_images do
  transient do
  image_count 3
  end

  after(:create) do |idea, evaluator|
  idea.images << create_list(:image, evaluator.image_count)
      end
    end
  end
end
