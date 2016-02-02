require 'rails_helper'

RSpec.describe Goal, type: :model do

  let(:goal) {build :goal}
  let(:goal_no_title) {build :goal, :no_title}
  let(:goal_no_user_id) {build :goal, :no_user_id}
  let(:goal_no_date) {build :goal, :no_date}
  let(:goal_no_public) {build :goal, :no_public}
  let(:goal_no_complete) {build :goal, :no_complete}


  context 'validations' do
    it "all fields are filled" do
      expect(goal).to be_valid
    end

    it "validates title" do
      expect(goal_no_title).not_to be_valid
    end

    it "validates user" do
      expect(goal_no_user_id).not_to be_valid
    end

    it "validates date" do
      expect(goal_no_date).not_to be_valid
    end

    it "validates public" do
      expect(goal_no_public).not_to be_valid
    end

    it "validates complete" do
      expect(goal_no_complete).not_to be_valid
    end
  end

  context 'associations' do
    it 'associates users' do
      should belong_to(:user)
    end
  end

end
