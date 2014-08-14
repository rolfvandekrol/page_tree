module PageTree
  class Page < ActiveRecord::Base
    extend FriendlyId

    acts_as_nested_set dependent: :destroy

    friendly_id :slug_candidates, use: [:slugged, :scoped], scope: :parent_id, slug_generator_class: PageTree::Core::SlugGenerator
    
    def slug_candidates
      [
        :title,
        [:title, :id]
      ]
    end

    def should_generate_new_friendly_id?
      !send(friendly_id_config.base).nil?
    end

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
