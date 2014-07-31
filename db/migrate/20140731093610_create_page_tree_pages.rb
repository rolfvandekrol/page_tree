class CreatePageTreePages < ActiveRecord::Migration
  def change
    create_table :page_tree_pages do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
