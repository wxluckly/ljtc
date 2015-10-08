class CreateTravelLogs < ActiveRecord::Migration
  def change
    create_table :travel_logs do |t|
      t.integer :travel_id
      t.integer :staffer_id
      t.string  :action
      t.timestamps null: false
    end
  end
end
