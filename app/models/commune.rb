class Commune < ApplicationRecord
  belongs_to :intercommunality
  has_many :commune_streets
  has_many :streets, through: :commune_streets

  validates :name, presence: true
  validates :code_insee, presence: true, length: { minimum: 5 }
end
