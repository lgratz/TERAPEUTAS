class CreateTherapists < ActiveRecord::Migration[5.2]
  def change
    create_table :therapists do |t|
      t.string :address
      t.string :phone
      t.string :photos
      t.integer :session_price
      t.text :self_description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
