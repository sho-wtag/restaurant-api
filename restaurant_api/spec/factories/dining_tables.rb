FactoryBot.define do
  factory :dining_table_1, class: DiningTable do
    association :restaurant, factory: :restaurant_1
    name "Table-1"
    min_capacity 1
    max_capacity 4
  end
end
