require 'spec_helper'

feature 'adding housing form', %q{
As a user 
I can post houses available for renting
} do 
# AC:
# I have to enter in all the attributes
# I have to have a form
# I have to have a captcha to verify it is a person

context 'when given valid attributes' do 
  it 'enables you to fil out a form' do 
    visit new_housing_path  
    fill_in 'Type of housing', with: 'One Bedroom'
    fill_in 'City', with: 'Boston'
    fill_in 'State', with: 'MA'
    fill_in 'Price', with: '1000'
    fill_in 'Contact number', with: '6179388117'
    fill_in 'Contact email', with: 'r4eth@yahoo.com'
    click_on 'Create Housing'
    expect(page).to have_content('Thank You for Sending Us Rental Information')
  end
 end

 context 'when given invalid attributes' do 
  it 'gives error message if field is missing' do 
    visit new_housing_path
    click_on 'Create Housing'
    expect(page).to have_content("Type of housing can't be blank")
    expect(page).to have_content("City can't be blank")
    expect(page).to have_content("State can't be blank")
    expect(page).to have_content("Price can't be blank")
    expect(page).to have_content("Contact number can't be blank")
    expect(page).to have_content("Contact email can't be blank")

  end
 end
end

