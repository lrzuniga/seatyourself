# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :reservation do
    restaurant_id 1
    diner_id 1
    party_size 1
    time "2013-09-18 17:37:40"
  end
end
