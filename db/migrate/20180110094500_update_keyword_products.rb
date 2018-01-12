class UpdateKeywordProducts < ActiveRecord::Migration[5.1]
  def change

    rename_column :products, :name, :proname
    rename_column :products, :desc, :prodesc

  end
end
