class CallList < ActiveRecord::Base
  validates :user, presence: true 
  validates :phone_number, presence: true, numericality: true
  validates :reason, presence: true, inclusion: { in: %w(Homes Jobs Both) }

  belongs_to :user
end
