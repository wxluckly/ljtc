class AddColumnsShareCountToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :share_count, :integer
  end
end
