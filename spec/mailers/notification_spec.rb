require 'spec_helper'

describe Notification do 

  before(:each) do
    ActionMailer::Base.deliveries = []
  end

  it 'sends an email with successful registration' do
    prev_mail_count = ActionMailer::Base.deliveries.count
    @user = FactoryGirl.create(:user).register
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end

  it 'sends an email when a new job is posted' do 
    prev_mail_count = ActionMailer::Base.deliveries.count
    @job = FactoryGirl.create(:job)
    @user = FactoryGirl.create(:user).notify
    expect(ActionMailer::Base.deliveries.count).to eql(prev_mail_count + 1)
  end 
end
