class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist

  validates :category_selected, :session_date, presence: true
end
