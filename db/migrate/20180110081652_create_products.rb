class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :desc
      t.integer :old_price
      t.integer :new_price

      t.timestamps
    end
  end
end
