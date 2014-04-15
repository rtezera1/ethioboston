class CallList < ActiveRecord::Base
  validates :user, presence: true 
  validates :phone_number, presence: true, numericality: true, uniqueness: {scope: :user, message: "Can only have one vote"}
  validates :reason, presence: true, inclusion: { in: %w(homes jobs both) }

  belongs_to :user
end
