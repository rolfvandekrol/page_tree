module PageTree
  class Page < ActiveRecord::Base
    acts_as_nested_set dependent: :destroy
  end
end
