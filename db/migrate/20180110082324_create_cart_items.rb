class CreateCartItems < ActiveRecord::Migration[5.1]
  def change
    create_table :cart_items do |t|
      t.references :product, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :count, default: 1

      t.timestamps
    end
  end
end
