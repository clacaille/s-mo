class Commune < ApplicationRecord
  belongs_to :intercommunality, optional: true
  has_many :commune_streets
  has_many :streets, through: :commune_streets

  validates :name, presence: true
  validates :code_insee, presence: true, uniqueness: true, length: { is: 5 }

  def self.search(string)
    Commune.where('name LIKE ?', "%#{sanitize_sql_like(string.mb_chars.downcase)}%")
  end

  def self.to_hash
    Commune.all.map { |c| [c.code_insee, c.name] }.to_h
  end
end
