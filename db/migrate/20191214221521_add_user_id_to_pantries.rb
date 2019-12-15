class AddUserIdToPantries < ActiveRecord::Migration[6.0]
  def change
    add_column :pantries, :user_id, :integer
  end
end
