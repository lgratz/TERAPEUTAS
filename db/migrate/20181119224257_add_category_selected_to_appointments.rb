class AddCategorySelectedToAppointments < ActiveRecord::Migration[5.2]
  def change
    add_column :appointments, :category_selected, :string
  end
end
