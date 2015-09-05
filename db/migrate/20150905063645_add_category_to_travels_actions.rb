class AddCategoryToTravelsActions < ActiveRecord::Migration
  def change
    add_column :travels_actions, :action, :string
  end
end
