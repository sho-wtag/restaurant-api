class ReservationsController < ApplicationController
  def index
    if params[:restaurant_id]
      restaurant = Restaurant.find(params[:restaurant_id])
      reservations = restaurant.reservations
      if reservations.present?
        render json: { data: reservations.map{|res|res.response_json} }, status: :ok
      else
        render json: { data: {} }, status: :not_found
      end
    end
  end

  def create
    guest = Guest.new(guest_params)
    if guest.save
      reservation = Reservation.new(reservation_params.merge!({guest_id: guest.id}))
      if reservation.save
        GuestMailer.confirmation_email(guest, reservation).deliver_now
        RestaurantMailer.new_reservation_notifier(guest, reservation).deliver_now
        render json: { data: { reservation: reservation.response_json } }, status: :ok
      else
        render json: { errors: reservation.errors.full_messages }, status: :bad_request
      end
    else
      render json: { errors: guest.errors.full_messages }, status: :bad_request
    end
  end

  def update
    reservation = Reservation.find(params[:id])
    old_reservation = fetch_old_details(reservation)
    if reservation.update_attributes(reservation_params)
      GuestMailer.update_reservation_notifier(old_reservation, reservation).deliver_now
      render json: { data: { reservation: reservation.response_json } }, status: :ok
    else
      render json: { errors: reservation.errors.full_messages }, status: :bad_request
    end
  end

  private

  def fetch_old_details(reservation)
    { restaurant_name: reservation.restaurant.name,
      reservation_time: reservation.parsed_reservation_time,
      guest_count: reservation.guest_count,
      dining_table: reservation.dining_table.name }
  end

  def guest_params
    params.require(:guest).permit(:email, :name)
  end

  def reservation_params
    params.require(:reservation).permit(:shift_id,
                                        :reservation_time,
                                        :guest_count,
                                        :dining_table_id,
                                        :restaurant_id)
  end
end
