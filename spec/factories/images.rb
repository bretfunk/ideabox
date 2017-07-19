FactoryGirl.define do
  factory :image do
    sequence :url do |i|
    "url#{i}"
    end
  end
end
