class AddSubIdToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :sub_id, :integer
  end
end
