module PageTree
  class Page < ActiveRecord::Base
    extend FriendlyId

    acts_as_nested_set dependent: :destroy

    friendly_id :title, use: [:slugged, :scoped], scope: :parent_id
  end
end
