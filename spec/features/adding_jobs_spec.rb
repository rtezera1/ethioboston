require 'spec_helper'

feature 'adding a form for users to post a job opening', %q{
  As a user
  I can post a job opening so that authenticated users 
  can see it.
} do 
# AC:
# I have to have a form
# I have to have a captcha tp verify it is a person
# I have to enter all the attributes
  context 'when given valid attributes' do  
    it 'allows users to post a job opening' do 
      visit new_job_path
      fill_in 'Name', with: 'Mike'
      fill_in 'Email', with: 'mike@gmail.com'
      fill_in 'Job title', with: 'Valet Attendant'
      fill_in 'Description', with: 'Driving a car and getting tips'
      fill_in 'Location', with: 'Boston'
      fill_in 'Contact phone number', with: '6178377728'

      click_on 'Create Job'

      expect(page).to have_content("Thank You for Sending Us Job Opening Information")

    end
  end

  context 'when given invalid information' do 
    it 'gives errors if required fields are missing' do 
      visit new_job_path

      click_on 'Create Job'
      expect(page).to have_content("Name can't be blank")
      expect(page).to have_content("Job title can't be blank")
      expect(page).to have_content("Description can't be blank")
      expect(page).to have_content("Location can't be blank")

      expect(page).to have_content("Contact phone number can't be blank")
      expect(page).to have_content("Email can't be blank")
    end
  end
end
