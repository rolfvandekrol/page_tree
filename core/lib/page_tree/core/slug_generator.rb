require 'friendly_id/slug_generator'

module PageTree
  module Core
    class SlugGenerator < FriendlyId::SlugGenerator
      def available?(slug)
        return false if @scope.model.reserved_slugs.include? slug
        return super(slug)
      end
    end
  end
end