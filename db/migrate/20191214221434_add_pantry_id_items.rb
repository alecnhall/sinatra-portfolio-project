class AddPantryIdItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :pantry_id, :integer
  end
end
