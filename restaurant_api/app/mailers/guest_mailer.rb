class GuestMailer < ApplicationMailer
  def confirmation_email(guest, reservation)
    @guest = guest
    @reservation = reservation
    mail(to: @guest.email, subject: 'New reservation confirmed!')
  end

  def update_reservation_notifier(old_reservation, reservation)
    @guest = reservation.guest
    @old_reservation = old_reservation
    @reservation = reservation
    mail(to: @guest.email, subject: 'Reservation details updated.')
  end
end
