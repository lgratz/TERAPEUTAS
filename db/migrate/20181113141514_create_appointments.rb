class CreateAppointments < ActiveRecord::Migration[5.2]
  def change
    create_table :appointments do |t|
      t.references :user, foreign_key: true
      t.references :therapist, foreign_key: true
      t.datetime :session_date
      t.integer :price
      t.string :status, default: "Pendente"
      t.integer :rating

      t.timestamps
    end
  end
end
