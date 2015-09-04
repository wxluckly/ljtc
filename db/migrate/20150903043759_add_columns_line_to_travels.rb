class AddColumnsLineToTravels < ActiveRecord::Migration
  def change
    add_column :travels, :line, :string
    add_column :travels, :sentiment, :text
  end
end
