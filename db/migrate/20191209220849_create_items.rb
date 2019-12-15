class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |i|
      i.string :name
      i.integer :amount
    end
  end
end
