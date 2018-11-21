class CreateCalendars < ActiveRecord::Migration[5.2]
  def change
    create_table :calendars do |t|
      t.string :mon, default: "8,9,10,11,12,13,14,15,16,17,18,19,20"
      t.string :tue, default: "8,9,10,11,12,13,14,15,16,17,18,19,20"
      t.string :wed, default: "8,9,10,11,12,13,14,15,16,17,18,19,20"
      t.string :thu, default: "8,9,10,11,12,13,14,15,16,17,18,19,20"
      t.string :fri, default: "8,9,10,11,12,13,14,15,16,17,18,19,20"
      t.string :sat, default: "8,9,10,11,12,13"
      t.string :sun, default: ""
      t.references :therapist, foreign_key: true

      t.timestamps
    end
  end
end
