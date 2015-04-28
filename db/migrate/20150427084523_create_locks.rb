class CreateLocks < ActiveRecord::Migration
  def change
    create_table :locks do |t|
      t.integer :admin_id
      t.string :mac

      t.timestamps null: false
    end
    add_index :locks, :mac
  end
end
