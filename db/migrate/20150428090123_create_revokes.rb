class CreateRevokes < ActiveRecord::Migration
  def change
    create_table :revokes do |t|
      t.string :user_id
      t.string :key_id

      t.timestamps null: false
    end
  end
end
