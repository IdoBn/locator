# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :checkin do
    user_id 1
    latitude 1.5
    longitude 1.5
    address "MyString"
  end
end
