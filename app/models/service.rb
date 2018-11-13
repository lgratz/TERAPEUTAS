class Service < ApplicationRecord
  belongs_to :therapist
  belongs_to :category
end
