class AddUserIdToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :user_id, :integer
    add_index :travels, :user_id
  end
end
