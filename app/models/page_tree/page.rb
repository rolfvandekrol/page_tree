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

    def path
      self.self_and_ancestors.to_a.from(1).map(&:slug).join('/')
    end
  end
end
