require 'spec_helper'
require 'rails_helper'

feature 'create goal' do
  before :each do
    sign_up("Ted")
  end

  it 'has a new goal page' do
    visit new_goal_url
    expect(page).to have_content "New Goal"
  end

  it 'shows the goal, target date, and publicity on user show page' do
    create_goal('test-goal')
    expect(page).to have_content "test-goal"
    expect(page).to have_content "2017-01-01"
    expect(page).to have_content "Public"
  end

  it 'shows a public goal on the goal index' do
    create_goal('test-goal')
    visit goals_url
    expect(page).to have_content "test-goal"
    expect(page).to have_content "2017-01-01"
    expect(page).to have_content "Ted"
  end

end

feature 'edit goal' do
  before :each do
    sign_up("Ted")
  end

  it 'has a edit goal page' do
    create_goal('test-goal')
    click_on "Edit Goal"
    expect(page).to have_content "Edit Goal"
    expect(page).to have_selector("input[value='test-goal']")
    expect(page).to have_selector("input[value='2017-01-01']")
    checkbox = find('#public')
    expect(checkbox).to be_checked
  end

  it 'successfully edits the goal' do
    edit_goal
    expect(page).to have_content "other_title"
    expect(page).to have_content "2018-01-01"
    expect(page).to have_content "Private"
  end

  it 'Does not show private goals on the goal index' do
    edit_goal
    visit goals_url
    expect(page).not_to have_content "other_title"
    expect(page).not_to have_content "2018-01-01"
    expect(page).not_to have_content "Ted"
  end

  it 'Removes completed goals from current goals' do
    edit_goal
    within('#incomplete') do
      expect(page).not_to have_content "other_title"
      expect(page).not_to have_content "2018-01-01"
      expect(page).not_to have_content "Ted"
    end
  end

end

feature 'destroy goal' do
  before :each do
    sign_up("Ted")
    create_goal('test-goal')
  end

  it 'Has a delete goal button on user page' do
    expect(page).to have_content "Remove Goal"
  end

  it 'Removes goal from user' do
    click_on "Remove Goal"
    expect(page).not_to have_content "test_goal"
  end

  it 'removes goal from goal index' do
    click_on "Remove Goal"
    visit goals_url
    expect(page).not_to have_content "test-goal"
  end

end










  # it "shows completed goals under a completed list" do
  #   creates_goal('test-goal')
  #
  # end
