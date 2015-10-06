class AddDetailsToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :user_name, :string
    add_column :posts, :post_type, :string
  end
end
