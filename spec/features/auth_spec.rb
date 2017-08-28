require 'rails_helper'

feature 'the signup process' do

  scenario 'has a new user page' do
    visit new_user_url
    expect(page).to have_content 'New user'
  end

  feature 'signing up a user' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Create User'
    end

    scenario 'redirects to user show page after signup' do
      expect(page).to have_content 'Hi'
    end

    scenario 'shows username on the homepage after signup' do
      expect(page).to have_content 'testing_username'
    end
  end

  feature 'logging in' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Create User'
      visit new_session_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Sign In'
    end
    scenario 'shows username on the homepage after login' do
      expect(page).to have_content 'testing_username'
    end
  end

  feature 'logging out' do
    before(:each) do
      visit new_user_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Create User'
      visit new_session_url
      fill_in 'username', with: 'testing_username'
      fill_in 'password', with: 'biscuits'
      click_on 'Sign In'
    end
    scenario 'includes a sign out button' do
      expect(page).to have_selector(:link_or_button, 'Sign Out')
    end
    scenario 'doesn\'t show username on the homepage after logout' do
      click_on 'Sign Out'
      expect(page).to_not have_content 'testing_username'
    end
  end
end
