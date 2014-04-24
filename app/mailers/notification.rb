class Notification < ActionMailer::Base
  default from: "from@example.com"

  def receipt(user)
    @user = user
    @confirmation = 'Thank you for signing up.'

    mail to: user.email,
      subject: 'Confirmation'
  end

  def update
    User.find_each do |user|

      mail to: user.email,
        subject: 'New Job Posted'
    end
  end

  def new_job
    User.find_each do |user|

      mail to: user.email,
        subject: 'New House Listing Posted'
    end
  end
end
