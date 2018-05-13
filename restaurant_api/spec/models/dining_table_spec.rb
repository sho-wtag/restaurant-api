require 'rails_helper'

RSpec.describe DiningTable, type: :model do
  describe 'associations' do
    context 'for belongs to' do
      it 'belongs to restaurant' do
        dining_table = DiningTable.reflect_on_association(:restaurant)
        expect(dining_table.macro).to eq(:belongs_to)
        is_expected.to belong_to(:restaurant)
      end
    end

    context 'for has many' do
      it 'has many reservations' do
        dining_table = DiningTable.reflect_on_association(:reservations)
        expect(dining_table.macro).to eq(:has_many)
        is_expected.to have_many(:reservations)
      end
    end
  end
end
