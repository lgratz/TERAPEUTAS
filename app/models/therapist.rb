class Therapist < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :services, dependent: :destroy
end
