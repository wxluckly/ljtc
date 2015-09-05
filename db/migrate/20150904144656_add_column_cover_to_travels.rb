class AddColumnCoverToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :cover, :string
    add_column :users, :avatar, :string
  end
end
