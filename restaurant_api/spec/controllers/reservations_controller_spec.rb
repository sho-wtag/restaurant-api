require 'rails_helper'

RSpec.describe ReservationsController, type: :controller do
  describe 'GET #index' do
    let(:restaurant) { create(:restaurant_1)}
    let(:reservation_1) { create(:reservation, restaurant_id: restaurant.id )}
    let(:reservation_2) { create(:reservation, restaurant_id: restaurant.id )}
    before do
      get :index, params: { restaurant_id: reservation_2.restaurant.id }
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should return list of reservations of restaurant" do
      hash_body = JSON.parse(response.body)
      expect(hash_body.count).to eq(1)
    end
  end

  describe 'POST #create' do
    let(:shift) { create(:morning_shift) }
    let(:dining_table) { create(:dining_table_1) }
    let(:restaurant) { create(:restaurant_1)}

    it "should returns http success" do
      post :create, params: hash_params_for_post(shift, dining_table, restaurant)
      expect(response).to have_http_status(:success)
    end

    it "should return reservation data" do
      post :create, params: hash_params_for_post(shift, dining_table, restaurant)
      hash_body = JSON.parse(response.body)
      expect(hash_body["data"]["reservation"]).to be_truthy
    end

    it "should return error for incorrect dining table capacity" do
      post :create, params: invalid_capacity_hash_params_for_post(shift, dining_table, restaurant)
      hash_body = JSON.parse(response.body)
      expect(hash_body["errors"].present?).to be_truthy
      expect(hash_body["errors"]).to eq(["Number of guests is higher than the selected dining table's capacity"])
    end
  end

  describe 'PUT #update' do
    let(:reservation) { create(:reservation)}

    before do
      put :update, params: hash_params_for_put(reservation)
    end

    it "returns http success" do
      expect(response).to have_http_status(:success)
    end

    it "should return reservation data" do
      hash_body = JSON.parse(response.body)
      expect(hash_body["data"]["reservation"]).to be_truthy
      expect(hash_body["data"]["reservation"]["guest_count"]).to eq(4)
    end
  end

  private

  def hash_params_for_post(shift, dining_table, restaurant)
    {
      "guest":{
      	"name": "altruist",
        "email": "altruist2692@gmail.com"
      },
      "reservation":{
      	"dining_table_id": dining_table.id,
        "restaurant_id": restaurant.id,
        "guest_count": 2,
        "reservation_time": "9 AM",
        "shift_id": shift.id
      }
    }
  end

  def invalid_capacity_hash_params_for_post(shift, dining_table, restaurant)
    hash_params_for_post(shift, dining_table, restaurant).merge!({ reservation: {
      "dining_table_id": dining_table.id,
      "restaurant_id": restaurant.id,
      "guest_count": 99,
      "reservation_time": "9 AM",
      "shift_id": shift.id
    } })

  end

  def hash_params_for_put(reservation)
    {
      id: reservation.id,
      "reservation":{
        "guest_count": 4
      }
    }
  end
end
