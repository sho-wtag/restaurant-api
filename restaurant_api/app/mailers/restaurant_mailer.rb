class RestaurantMailer < ApplicationMailer
  def new_reservation_notifier(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: @reservation.restaurant.email, subject: 'Got New reservation!')
  end
end
