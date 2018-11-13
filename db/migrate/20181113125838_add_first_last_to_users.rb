class AddFirstLastToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first, :string
    add_column :users, :last, :string
  end
end
