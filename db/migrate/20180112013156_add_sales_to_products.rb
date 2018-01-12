class AddSalesToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :sales, :integer
  end
end
