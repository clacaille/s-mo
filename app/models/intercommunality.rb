class Intercommunality < ApplicationRecord
  has_many :communes

  validates :name, presence: true
  validates :siren, presence: true, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :form, inclusion: { in: ["ca", "cu", "cc", "met"] }
end
