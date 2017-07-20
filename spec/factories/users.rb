FactoryGirl.define do
  factory :user do
    sequence :username do |i|
    "username#{i}"
  end
    password_digest "MyString"
  end
end
