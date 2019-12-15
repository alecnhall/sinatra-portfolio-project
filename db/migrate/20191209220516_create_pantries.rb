class CreatePantries < ActiveRecord::Migration[6.0]
  def change
    create_table :pantries do |p|
      p.string :name
      p.string :nationality
    end
  end
end
