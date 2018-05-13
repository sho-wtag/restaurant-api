FactoryBot.define do
  factory :morning_shift, class: Shift do
    start_time Time.zone.parse('9AM')
    end_time Time.zone.parse('1PM')
  end

  factory :evening_shift, class: Shift do
    start_time Time.zone.parse('6PM')
    end_time Time.zone.parse('11PM')
  end
end
