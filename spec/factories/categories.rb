FactoryGirl.define do
  factory :category do
    sequence :name do |i|
    "name#{i}"
    end

    trait :with_ideas do
transient do
idea_count 3
end

after(:create) do |category, evaluator|
category.ideas << create_list(:idea, evaluator.idea_count)
      end
    end
  end
end
