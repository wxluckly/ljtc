class AddColumnEventIdToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :event_id, :integer
  end
end
