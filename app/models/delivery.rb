class Delivery < ActiveRecord::Base
  attr_accessible :name

  has_many :orders
end
