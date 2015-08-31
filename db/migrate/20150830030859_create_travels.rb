class CreateTravels < ActiveRecord::Migration
  def change
    create_table :travels do |t|
      t.string  :title
      t.text    :content, limit: 16777215
      t.integer :tag_id
      t.integer :category_id
      t.boolean :is_finished
      t.boolean :is_verified
      t.boolean :is_blocked
      t.timestamps null: false
    end
  end
end
