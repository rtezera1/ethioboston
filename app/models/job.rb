class Job < ActiveRecord::Base
  
  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]+\z/ }
  validates :job_title, presence: true
  validates :location, presence: true
  validates :description, presence: true, length: { maximum: 400}
  validates :contact_phone_number, presence: true, length: { minimum: 10, maximum: 10 }, numericality: { only_integer: true }

  belongs_to :user

  max_paginates_per 5

  mount_uploader :avatar, AvatarUploader
end
