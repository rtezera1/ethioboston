class Notification < ActionMailer::Base
  default from: "from@example.com"

  def notice(ethioboston_registration)
    @ethioboston_registration = ethioboston_registration

    mail to: ethioboston_registration.email,
      subject: 'Confirmation'
  end

end
