require 'spec_helper'

feature 'authenticated user signing out', %q{
    As a signed in user
    I want to be able to sign out
    So I can safely end my session} do
  # AC:
  # The navbar has a sign out button and confirms successful sign out when clicked

  context 'signed in, want to sign out' do

    it 'should sign out the user' do
      @user = FactoryGirl.create(:user)
      visit new_user_session_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: @user.password
      within "#new_user" do
        click_on "Sign in"
      end
      click_on "Sign Out"
      expect(page).to have_content('Signed out successfully')
      expect(page).to have_content('Sign In')
    end

  end

  context 'signed out user' do

    it 'should prevent user from accessing pages' do
      visit housings_path
      expect(page).to have_content('You need to sign in or sign up before continuing.')
    end

  end

end
