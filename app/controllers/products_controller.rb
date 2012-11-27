class ProductsController < ApplicationController
  def show
    @product = Product.includes(:catalogue_section).find params[:id]
  end

  def find_products
    @products = Kaminari.paginate_array(Product.find(:all, :joins => :catalogue_section, :conditions => ['products.name like ? OR products.kod like ? OR catalogue_sections.name like ?', '%'+params[:query]+'%', '%'+params[:query]+'%', '%'+params[:query]+'%'])).page params[:page]
  end
end
