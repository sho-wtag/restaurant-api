require 'rails_helper'

RSpec.describe Restaurant, type: :model do
  it "should have a fixed list constant" do
    Restaurant.should have_constant(:VALID_PHONE_REGEX)
    Restaurant.should have_constant(:VALID_EMAIL_REGEX)
  end

  describe 'associations' do
    let(:restaurant){create(:restaurant_1)}
    it { expect(restaurant).to belong_to(:shift) }
    it { expect(restaurant).to have_many(:dining_tables) }
    it { expect(restaurant).to have_many(:reservations) }
  end

  describe 'validations' do
    context '#phone' do
      it { should validate_presence_of(:phone) }
      it { should allow_value('(989) 866-5544').for(:phone) }
      it { should allow_value('989.866.5544').for(:phone) }
      it { should allow_value('989-866-5544').for(:phone) }
      it { should allow_value('9898665544').for(:phone) }
      it { should_not allow_value('123').for(:phone) }
    end

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
