FactoryGirl.define do
  factory :user do
    sequence :username do |i|
    "username#{i}"
    password_digest "MyString"
  end
end
