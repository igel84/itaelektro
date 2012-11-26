class Article < ActiveRecord::Base
  attr_accessible :title, :body, :name, :to_main_block
end
