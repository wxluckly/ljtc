class AddColumnsReadCountToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :read_count, :integer
    add_column :travels, :like_count, :integer
    add_column :travels, :area_id, :integer
  end
end
