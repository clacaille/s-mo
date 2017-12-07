class Street < ApplicationRecord
  has_many :commune_streets
  has_many :communes, through: :commune_streets

  validates :title, presence: true
  validates :from, numericality: { allow_nil: true }
  validates :to, numericality: { greater_than: :from, allow_nil: true }
end
