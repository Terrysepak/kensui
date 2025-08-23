class Park < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

end
