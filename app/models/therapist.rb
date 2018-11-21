class Therapist < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :categories, through: :services

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photos, PhotoUploader

  validates :user_id, uniqueness: true

  # monetize :price_cents
end
