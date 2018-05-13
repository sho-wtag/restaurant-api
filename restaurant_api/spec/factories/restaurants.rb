FactoryBot.define do
  factory :restaurant_1, class: Restaurant do
     name "Restaurant 1"
     email "foo@bar.com"
     phone "(123) 222-3333"
     association :shift, factory: :morning_shift
  end
end
