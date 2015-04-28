class CreateKeys < ActiveRecord::Migration
  def change
    create_table :keys do |t|
      t.integer :user_id
      t.integer :admin_id
      t.string :mac
      t.string :passphrase

      t.timestamps null: false
    end
  end
end
