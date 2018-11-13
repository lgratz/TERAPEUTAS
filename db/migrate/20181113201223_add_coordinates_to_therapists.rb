class AddCoordinatesToTherapists < ActiveRecord::Migration[5.2]
  def change
    add_column :therapists, :latitude, :float
    add_column :therapists, :longitude, :float
  end
end
