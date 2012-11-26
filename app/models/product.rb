#encoding: utf-8
class Product < ActiveRecord::Base

  attr_accessible :product_id, :catalogue_section_id, :name, :title, :brand, :price, :kod, :product_images_attributes, :top_product_attributes, :bottom_product_attributes
  
  has_many :product_images, dependent: :destroy
  belongs_to :catalogue_section
  
  accepts_nested_attributes_for :product_images, allow_destroy: true
  validates :catalogue_section_id, presence: true
  serialize :top_product_attributes, Array
  serialize :bottom_product_attributes, Array  
  
  def top_product_attributes_enum
    ProductAttribute.all.collect { |attr| ["#{attr.name}: #{attr.value}", attr.id] }
  end 

  def bottom_product_attributes_enum
    ProductAttribute.all.collect { |attr| ["#{attr.name}: #{attr.value}", attr.id] }
  end 

  def additional_top_attributes
    top_product_attributes.delete_if { |i| i.empty? }
    ProductAttribute.find(top_product_attributes.uniq)
  end  

  def additional_bottom_attributes
    bottom_product_attributes.delete_if { |i| i.empty? }
    ProductAttribute.find(bottom_product_attributes.uniq)
  end

  def main_image
    if product_images && product_images != []
      product_images.first.image
    else
      nil
    end
  end

  def self.tax
    0.18
  end

  def full_price
    price + price * Product.tax
  end
  
end
