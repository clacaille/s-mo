class AddIntercommunalityToCommunes < ActiveRecord::Migration[5.0]
  def change
    add_reference :communes, :intercommunality, foreign_key: true
  end
end
