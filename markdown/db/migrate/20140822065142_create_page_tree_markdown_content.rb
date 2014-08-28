class CreatePageTreeMarkdownContent < ActiveRecord::Migration
  def change
    create_table :page_tree_markdown_content do |t|
      t.integer :page_id
      t.string :content_type
      
      t.text :body

      t.timestamps

      t.index [:page_id, :content_type], unique: true
    end
  end
end
