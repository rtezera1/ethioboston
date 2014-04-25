class HousingNotifierWorker
  include Sidekiq::Worker


  def perform(housing_id)
    CallList.find_each do |user|
      if user.reason == 'Homes' || user.reason == 'Both'        
        @housing = Housing.find(housing_id)
        message = Message.new
        message.send_text( user.phone_number, @housing.type_of_housing )
      end
    end

    Notification.new_house(@housing).deliver
  end
end

