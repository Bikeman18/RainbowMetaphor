class AddPublickeyToUser < ActiveRecord::Migration
  def change
    add_column :users, :publickey, :sting
  end
end
