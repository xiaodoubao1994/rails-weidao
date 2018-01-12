class AddImgToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :img_1, :string
    add_column :products, :img_2, :string
    add_column :products, :img_3, :string
    add_column :products, :img_4, :string
  end
end
