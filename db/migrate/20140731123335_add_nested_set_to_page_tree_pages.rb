class AddNestedSetToPageTreePages < ActiveRecord::Migration
  def change
    change_table :page_tree_pages do |t|
      t.integer :parent_id
      t.integer :lft
      t.integer :rgt
      t.integer :depth
    end
  end
end
