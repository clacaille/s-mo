class CreateCommuneStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :commune_streets do |t|
      t.references :commune, foreign_key: true
      t.references :street, foreign_key: true

      t.timestamps
    end
  end
end
