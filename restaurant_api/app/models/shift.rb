class Shift < ApplicationRecord
  has_many :restaurants
  has_many :reservations
  validate :start_end_time

  TIME_FORMAT = "%I:%M%p".freeze # returns time in 08:00AM like format

  def start_end_time
    errors.add(:base, "End time can't be in past then start time.") if start_time > end_time
  end

  def parsed_start_time
    start_time.strftime(TIME_FORMAT)
  end

  def parsed_end_time
    end_time.strftime(TIME_FORMAT)
  end
end
