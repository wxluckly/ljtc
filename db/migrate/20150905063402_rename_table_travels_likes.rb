class RenameTableTravelsLikes < ActiveRecord::Migration
  def change
    rename_table :travels_likes, :travels_actions
  end
end
