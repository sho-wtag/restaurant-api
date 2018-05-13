FactoryBot.define do
  factory :reservation do
    association :shift, factory: :morning_shift
    reservation_time Time.zone.parse('10 AM')
    association :guest
    guest_count 2
    association :dining_table, factory: :dining_table_1
    association :restaurant, factory: :restaurant_1
  end
end
