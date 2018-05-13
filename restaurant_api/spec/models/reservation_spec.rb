require 'rails_helper'

RSpec.describe Reservation, type: :model do
  describe 'ActiveRecord associations' do
    let(:reservation) { build(:reservation) }
    it { expect(reservation).to belong_to(:restaurant) }
    it { expect(reservation).to belong_to(:dining_table) }
    it { expect(reservation).to belong_to(:shift) }
    it { expect(reservation).to belong_to(:guest) }
  end

  describe 'ActiveRecord validations' do
    let(:reservation) { create(:reservation) }
    it 'reservation_time is required' do
      reservation.reservation_time = nil
      expect(reservation.valid?).to be_falsy
      expect(reservation.errors.full_messages).to eq(["Reservation time can't be blank"])
    end

    it 'guest_count is required' do
      reservation.guest_count = nil
      expect(reservation.valid?).to be_falsy
      expect(reservation.errors.full_messages).to eq(["Guest count can't be blank"])
    end

    context '#valid_reservation_time' do
      let(:reservation) { create(:reservation) }
      it "should return error for invalid time" do
        reservation.reservation_time = Time.zone.parse('10 PM')
        expect(reservation.valid?).to be_falsy
        expect(reservation.errors.full_messages).to eq(["Reservation is only allowed between restaurant's shift hours which is 09:00AM to 01:00PM."])
      end
    end

    context '#valid_table_capacity' do
      let(:reservation) { create(:reservation) }
      it "should return error if guest count exceeds the capacity" do
        reservation.guest_count = 20
        expect(reservation.valid?).to be_falsy
        expect(reservation.errors.full_messages).to eq(["Number of guests is higher than the selected dining table's capacity"])
      end
      it "should return error if guest count less than the capacity" do
        reservation.guest_count = 0
        expect(reservation.valid?).to be_falsy
        expect(reservation.errors.full_messages).to eq(["Number of guests is less than the selected dining table's minimum capacity"])
      end
    end

    context '#response_json' do
      let(:reservation) { create(:reservation) }
      it 'should return hash of reservation details' do
        expect(reservation.response_json).to eq({
            id: reservation.id,
            reservation_time: '10:00AM',
            guest_count: reservation.guest_count,
            guest_name: 'foo',
            dining_table_name: 'Table-1'
        })
      end
    end

    context "#parsed_reservation_time" do
      let(:reservation) { create(:reservation) }
      it "should return parsed_reservation_time" do
        expect(reservation.parsed_reservation_time).to eq('10:00AM')
      end
    end
  end
end
