require 'spec_helper'
require 'rails_helper'

feature 'the signup process' do
  it 'has a new user page' do
    visit new_user_url
    expect(page).to have_content "New User"
  end

  feature "signing up a user" do
    it "shows username on the homepage after signup" do
      sign_up("test-name")
      expect(page).to have_content "test-name"
    end
  end
end

feature "logging in" do
  it "shows username on the homepage after login" do
    create_user("test-name")
    log_in("test-name")
    expect(page).to have_content "test-name"
  end
end

feature "logging out" do
  it "begins with logged out state" do
    visit root_url
    expect(page).to have_button "Log In"
  end

  it "doesn't show username on the homepage after logout" do
    create_user("test-name")
    expect(page).not_to have_content "test-name"
  end
end
