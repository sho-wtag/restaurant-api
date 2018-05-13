require 'rails_helper'

RSpec.describe Guest, type: :model do
  describe 'associations' do
    context 'for has many' do
      it 'has many reservations' do
        guest = Guest.reflect_on_association(:reservations)
        expect(guest.macro).to eq(:has_many)
        is_expected.to have_many(:reservations)
      end
    end
  end

  describe 'validations' do
    context '#email' do
      it { should validate_presence_of(:email) }
      it { should allow_value('email@addresse.foo').for(:email) }
      it { should_not allow_value('foo').for(:email) }
    end

    context '#name' do
      it { should validate_presence_of(:name) }
    end
  end
end
