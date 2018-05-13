require 'rails_helper'

RSpec.describe Shift, type: :model do
  describe 'associations' do
    context 'for has many' do
      it 'has many restaurants' do
        shift = Shift.reflect_on_association(:restaurants)
        expect(shift.macro).to eq(:has_many)
        is_expected.to have_many(:restaurants)
      end

      it 'has many reservations' do
        shift = Shift.reflect_on_association(:reservations)
        expect(shift.macro).to eq(:has_many)
        is_expected.to have_many(:reservations)
      end
    end
  end

  context "#parsed_start_time" do
    let(:shift) { create(:morning_shift) }
    it "should return parsed_start_time" do
      expect(shift.parsed_start_time).to eq('09:00AM')
    end
  end

  context "#parsed_end_time" do
    let(:shift) { create(:morning_shift) }
    it "should return parsed_end_time" do
      expect(shift.parsed_end_time).to eq('01:00PM')
    end
  end

  context "#start_end_time" do
    let(:shift) { create(:morning_shift) }
    it "should return start_end_time" do
      shift.start_time = Time.zone.parse('11:00AM')
      shift.end_time = Time.zone.parse('10:00AM')
      expect(shift.valid?).to be_falsy
    end
  end
end
