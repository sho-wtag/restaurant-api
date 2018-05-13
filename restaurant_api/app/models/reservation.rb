class Reservation < ApplicationRecord
  belongs_to :restaurant
  belongs_to :dining_table
  belongs_to :shift
  belongs_to :guest

  validates :reservation_time, :guest_count, presence: true
  validate :valid_reservation_time, :valid_table_capacity

  def valid_reservation_time
    if reservation_time.present?
      errors.add(:base, "Reservation is only allowed between restaurant's shift hours which is #{shift.parsed_start_time} to #{shift.parsed_end_time}.") if reservation_time < shift.start_time || reservation_time > shift.end_time
    end
  end

  def valid_table_capacity
    if guest_count.present?
      errors.add(:base, "Number of guests is higher than the selected dining table's capacity") if guest_count > dining_table.max_capacity
      errors.add(:base, "Number of guests is less than the selected dining table's minimum capacity") if guest_count < dining_table.min_capacity
    end
  end

  def parsed_reservation_time
    # returns time in 08:00AM like format
    reservation_time.strftime("%I:%M%p")
  end

  def response_json
    {
        id: id,
        reservation_time: parsed_reservation_time,
        guest_count: guest_count,
        guest_name: guest.name,
        dining_table_name: dining_table.name
    }
  end
end
