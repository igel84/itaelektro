class MenuItem < ActiveRecord::Base
  attr_accessible :name, :depth, :lft, :parent_id, :rgt, :url, :parent
  
  acts_as_nested_set# scope: :parent_id
  default_scope order('lft')

end
