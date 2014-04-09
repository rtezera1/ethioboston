require 'spec_helper'

feature 'viewer trying to sign in', %q{
  As a registered user
  I can sign in when I navigate to the site
  I can view housing available for rent
  I can view job openings
} do 


# AC:
# I have to enter email
# I have to enter password
# I get error message if I don't sign in 

  context 'filling out user information' do 
    before(:each) do 
      @user = FactoryGirl.create(:user)
    end

    it 'signs you in when you give valid entries' do 
      visit new_user_session_path
      fill_in 'Email', with: @user.email 
      fill_in 'Password', with: @user.password
      within '#new_user' do 
        click_on 'Sign in'
      end  

      expect(page).to have_content ('Signed in successfully.')
    end

    it "gives error message when you don't give email" do 
      visit new_user_session_path
      fill_in 'Email', with: ''
      fill_in 'Password', with: @user.password
      within "#new_user" do 
        click_on 'Sign in'
      end
      expect(page).to  have_content('Invalid email or password')
    end

    it 'gives you an error when you enter in incorrect password' do 
      visit new_user_session_path
      fill_in 'Email', with: @user.email
      fill_in 'Password', with: 'hickljsfkajs'
      within "#new_user" do 
        click_on 'Sign in'
      end
      expect(page).to  have_content('Invalid email or password')
    end

    it 'gives you an error when you enter in unregisterd email' do 
      visit new_user_session_path
      fill_in 'Email', with: 'sjdfkajsdkfja'
      fill_in 'Password', with: @user.password
      within "#new_user" do 
        click_on 'Sign in'
      end
      expect(page).to  have_content('Invalid email or password')
    end
  end
end
