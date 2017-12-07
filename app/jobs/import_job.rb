require 'csv'

class ImportJob < ApplicationJob
  queue_as :default

  def perform(file)
    csv_options = { col_sep: ';', headers: :first_row, encoding: 'iso-8859-1:utf-8' }
    CSV.foreach(file, csv_options) do |row|
      intercom = Intercommunality.find_by(siren: row["siren_epci"])
      if intercom.nil?
        intercom = Intercommunality.create(name: row["nom_complet"], siren: row["siren_epci"], form: row["form_epci"].downcase.sub("ro", ""))
      end
      Commune.create(name: row["nom_com"], code_insee: row["insee"], population: row["pop_total"], intercommunality: intercom)
    end
  end
end
