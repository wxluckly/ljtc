class AddDefaultToColumnsIsFinished < ActiveRecord::Migration
  def change
    change_column_default :travels, :is_finished, false
    change_column_default :travels, :is_blocked, false
    change_column_default :travels, :is_verified, false
  end
end
