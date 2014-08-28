PageTree::Page.class_eval do
  has_many :content, class_name: "PageTree::Markdown::Content"
end