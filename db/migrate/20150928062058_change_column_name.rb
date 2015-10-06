class ChangeColumnName < ActiveRecord::Migration
  def change
     rename_column :categories, :sub_id, :parent_id
  end
end
