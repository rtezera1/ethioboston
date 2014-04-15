class Twilio
  def initialize
    @client = Twilio::REST::Client.new(ENV['TWILIO_SID'], ENV['TWILIO_AUTH_TOKEN'])
  end

  def send_text(to, body)
    @client.account.messages.create({
      from: ENV['TWILIO_NUMBER'],
      to: to,
      body: body
    })
  end
end
