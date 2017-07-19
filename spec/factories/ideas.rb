FactoryGirl.define do
  factory :idea do
    sequence :idea do |i|
    "idea#{i}"
    end
    category
    user
  end
end
