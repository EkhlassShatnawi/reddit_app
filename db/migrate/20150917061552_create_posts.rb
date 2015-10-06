class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :description
      t.references :category, index: true, foreign_key: true
           # t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end