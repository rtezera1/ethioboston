require 'spec_helper'

feature 'viewer trying to fill jobs and housings form in', %q{
  As a registered user
  I have to be directed to all housings and jobs
} do 


# AC:
# I have to log in and get redirected to the dashboard page
  before(:each) do 
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email 
    fill_in 'Password', with: @user.password 
    within '#new_user' do 
      click_on 'Sign in'
    end
  end
  it 'displays all the housings and rents' do
    expect(page).to have_content('List of Jobs')
    expect(page).to have_content('List of Houses for Rent')
  end
end
