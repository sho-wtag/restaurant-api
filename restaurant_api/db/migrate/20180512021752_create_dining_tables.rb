class CreateDiningTables < ActiveRecord::Migration[5.1]
  def change
    create_table :dining_tables do |t|
      t.references :restaurant
      t.string :name
      t.integer :min_capacity
      t.integer :max_capacity

      t.timestamps
    end
  end
end
