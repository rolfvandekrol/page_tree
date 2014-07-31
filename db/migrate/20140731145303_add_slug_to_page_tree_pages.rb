class AddSlugToPageTreePages < ActiveRecord::Migration
  def change
    change_table :page_tree_pages do |t|
      t.string :slug

      t.index [:parent_id, :slug], unique: true
    end
  end
end
