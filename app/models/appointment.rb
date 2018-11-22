class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :therapist

  validates :category_selected, :session_date, presence: true
  validates :rating, inclusion: { in: [1, 2, 3, 4, 5] }
end
