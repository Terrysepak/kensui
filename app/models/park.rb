class Park < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :body, presence: true
  validates :address, presence: true
  geocoded_by :address
  after_validation :geocode

  has_many :park_equipments, dependent: :destroy
  has_many :equipments, through: :park_equipments
  has_many :comments, dependent: :destroy
end
