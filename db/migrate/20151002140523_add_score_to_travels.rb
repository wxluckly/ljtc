class AddScoreToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :score, :integer
  end
end
