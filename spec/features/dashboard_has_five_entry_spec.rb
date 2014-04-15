require 'spec_helper'

feature 'viewers can only see five items per page', %q{
  I can only see five items per page per item
} do 


# AC:
# I have to see five items per page

  before(:each) do 
    @user = FactoryGirl.create(:user)
    visit new_user_session_path
    fill_in 'Email', with: @user.email 
    fill_in 'Password', with: @user.password 
    within '#new_user' do 
      click_on 'Sign in'
    end
  end

  it 'should display five items' do 
    
