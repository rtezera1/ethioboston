require "spec_helper"

describe Notification do
  feature 'specifies valid information, for registration' do
  ActionMailer::Base.deliveries = []

  prev_count = Notification.count
  visit '/users/sign_up'
  fill_in 'Email', with: 'user@example.com'
  fill_in 'password', with: '12345678'
  fill_in 'password', with: '12345678'
  click_button 'Sign up'

  expect(page).to have_content('You registered successfully')
  expect(Notification.count).to eq(prev_count + 1)

  # upon registering, a confirmation email should be delivered,
  # so ActionMailer::Base.deliveries should include the email:
  expect(ActionMailer::Base.deliveries.size).to eql(1)

  # the email we just sent should have the proper subject and recipient:
  last_email = ActionMailer::Base.deliveries.last
  expect(last_email).to have_subject('Registration confirmed')
  expect(last_email).to deliver_to('user@example.com')
end

  pending "add some examples to (or delete) #{__FILE__}"
end
