module PageTree
  class Page < ActiveRecord::Base
    extend FriendlyId

    acts_as_nested_set dependent: :destroy

    friendly_id :title, use: [:slugged, :scoped], scope: :parent_id, slug_generator_class: PageTree::SlugGenerator

    def self.reserved_slugs
      @@reserved_slugs ||= []
    end
    def self.reserved_slugs= slugs
      @@reserved_slugs = slugs
    end
  end
end
