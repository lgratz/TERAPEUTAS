class Therapist < ApplicationRecord
  belongs_to :user
  has_many :appointments, dependent: :destroy
  has_many :services, dependent: :destroy
  has_many :categories, through: :services
  has_one :calendar, dependent: :destroy

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  after_create :create_calendar

  mount_uploader :photos, PhotoUploader

  validates :user_id, uniqueness: true

  # monetize :price_cents
end
