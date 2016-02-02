require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build :user}
  let(:user_no_username) {build :user, :no_username}
  let(:user_no_password) {build :user, :no_password}

  context 'validations' do

    it 'validates all field' do
      expect(user).to be_valid
    end

    it 'validates username' do
      expect(user_no_username).not_to be_valid
    end

    it 'validates password' do
      expect(user_no_password).not_to be_valid
    end
  end

  context 'associations' do

    it 'associates goals' do
      should have_many(:goals)
    end
  end
end
