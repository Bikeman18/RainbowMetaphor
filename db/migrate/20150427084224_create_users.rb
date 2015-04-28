class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone_number
      t.string :password
      t.string :nickname

      t.timestamps null: false
    end
    add_index :users, :phone_number
  end
end
