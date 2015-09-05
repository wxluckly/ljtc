class AddColumnSessionIdToTravelsLikes < ActiveRecord::Migration
  def change
    add_column :travels_likes, :session_id, :string
  end
end
