#encoding: utf-8
class CatalogueSection < ActiveRecord::Base
  attr_accessible :name, :products_attributes
  
  has_many :products, dependent: :destroy
  
  accepts_nested_attributes_for :products, allow_destroy: true

end
