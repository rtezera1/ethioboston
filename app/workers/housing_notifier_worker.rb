class HousingNotifierWorker
  include Sidekiq::Worker


  def perform(housing_id)
    CallList.find_each do |user|
      if user.reason == 'Homes' || user.reason == 'Both'
          # HousingNotifierWorker.perform_async(user.user_id, @housing.id)          
        housing = Housing.find(housing_id)
        Notification.update 
        message = Message.new
        message.send_text( user.phone_number, housing.type_of_housing )
      end
    end
  end
end
