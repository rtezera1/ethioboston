class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :jobs
  has_many :housings
  has_one :call_list

  def register
    if save 
      Notification.receipt(self).deliver
      return true
    end
  end

    def notify
    if save
      Notification.update.deliver
      return true
    end
  end
end
