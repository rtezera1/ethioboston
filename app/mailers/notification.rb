class Notification < ActionMailer::Base
  default from: "app23953176@heroku.com"

  def receipt(user)
    @user = user

    mail to: user.email,
      subject: 'Confirmation'
  end

  def new_job(job)
    @job = job 
    
    User.find_each do |user|

      mail to: user.email,
        subject: 'New Job Posted'
    end
  end

  def new_house(housing)
    @housing = housing

    User.find_each do |user|

      mail to: user.email,
        subject: 'New House Listing Posted'
    end
  end
end
