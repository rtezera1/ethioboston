class HousingNotifierWorker
  include Sidekiq::Worker


  def perform(housing_id)
    CallList.find_each do |user|
      if user.reason == 'Homes' || user.reason == 'Both'        
        @housing = Housing.find(housing_id)
        message = Message.new
        message.send_text( user.phone_number, "House Added: #{@housing.type_of_housing}-#{@housing.price}-#{@housing.contact_number}" )
      end
    end

    Notification.new_house(@housing).deliver
  end
end

