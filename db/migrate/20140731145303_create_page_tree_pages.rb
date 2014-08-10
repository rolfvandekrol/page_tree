class CreatePageTreePages < ActiveRecord::Migration
  def change
    create_table :page_tree_pages do |t|
      t.string :title

      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth

      t.string :slug

      t.timestamps

      t.index [:parent_id, :slug], unique: true
    end
  end
end
