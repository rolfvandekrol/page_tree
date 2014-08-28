module PageTree
  module Markdown
    class Content < ActiveRecord::Base
      self.table_name = :page_tree_markdown_content
      belongs_to :page
    end
  end
end