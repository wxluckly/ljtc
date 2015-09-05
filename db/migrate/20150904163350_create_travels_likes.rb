class CreateTravelsLikes < ActiveRecord::Migration
  def change
    create_table :travels_likes do |t|
      t.integer :travel_id
      t.string  :user_agent
      t.string  :user_ip
    end
  end
end
