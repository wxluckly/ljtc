class AddColumnNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :mobile, :string
  end
end
