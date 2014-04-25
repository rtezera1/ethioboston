class Housing < ActiveRecord::Base
  

  validates :type_of_housing, presence: true, length: { maximum: 140 }
  validates :city, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :state, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :price, presence: true, length: { maximum: 5 }, numericality: { only_integer: true }
  validates :contact_number, presence: true, length: { minimum: 10, maximum: 10 }, numericality: { only_integer: true }
  validates :contact_email, presence: true, format: { with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }

  belongs_to :user
  
  mount_uploader :avatar, AvatarUploader

  paginates_per 5


  def notify
    if save
      Notification.update.deliver
      return true
    end
  end
end
