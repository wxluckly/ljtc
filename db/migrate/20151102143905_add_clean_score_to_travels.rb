class AddCleanScoreToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :clean_score, :integer
  end
end
