require "spec_helper"

feature 'getting notification email' do 
  context 'specifies valid information, for registration' do

    before(:each) do
      ActionMailer::Base.deliveries = []
      @user = FactoryGirl.build(:user)
    end
    it 'sends an email' do 
      visit new_user_registration_path
      fill_in "Email", with: @user.email
      fill_in "Password", with: "11111111"
      fill_in "Password confirmation", with: "11111111"
      within "#new_user" do
        click_on "Sign up"
      end

      # expect(ActionMailer::Base.deliveries.size).to eql(1)
      last_email = ActionMailer::Base.deliveries.last
      expect(last_email).to have_subject('Confirmation')
      expect(last_email).to deliver_to(user.email)
    end
  end
end
