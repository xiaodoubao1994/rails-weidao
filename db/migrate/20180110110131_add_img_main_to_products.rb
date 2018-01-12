class AddImgMainToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :img, :string
  end
end
