class Intercommunality < ApplicationRecord
  after_save :set_slug

  has_many :communes

  validates :name, presence: true
  validates :siren, presence: true, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :form, inclusion: { in: ["ca", "cu", "cc", "met"] }

  def communes_hash
    communes.map { |commune| [commune.code_insee, commune.name] }.to_h
  end

  def set_slug
    if slug.nil?
      # need to use 'try' method because otherwise case_sensitive validation of siren would break
      self.slug = name.try(:parameterize)
    end
  end

  def population
    i = 0
    communes.each do |com|
      i += com.population
    end
    i
  end
end

