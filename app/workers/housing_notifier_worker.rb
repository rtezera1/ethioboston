class HousingNotifierWorker
  include Sidekiq::Worker
  include Sidetiq::Schedulable

  recurrence { daily }

  def perform(user_id, housing_id)
    user = CallList.find(user_id)
    housing = Housing.find(housing_id)
    Notification.update 
    message = Message.new
    message.send_text( user.phone_number, housing.type_of_housing )
  end
end
