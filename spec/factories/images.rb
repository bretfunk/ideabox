FactoryGirl.define do
  factory :image do
    sequence :url do |i|
    "url#{i}"
    end
    trait :with_ideas do
  transient do
  idea_count 3
  end

  after(:create) do |image, evaluator|
  image.ideas << create_list(:idea, evaluator.idea_count)
      end
    end
  end
end
