class CreateRestaurants < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :email
      t.string :phone
      t.references :shift

      t.timestamps
    end
  end
end
