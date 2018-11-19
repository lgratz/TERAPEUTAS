class Therapist < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :services, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  mount_uploader :photos, PhotoUploader

  # monetize :price_cents
end
