class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist

  validates :category_selected, presence: true
end
