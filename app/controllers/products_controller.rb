class ProductsController < ApplicationController
  def show
    @product = Product.includes(:catalogue_section).find params[:id]
  end

  def find_products
    if params[:query]
      @products = Kaminari.paginate_array(Product.find(:all, :joins => :catalogue_section, :conditions => ['products.name like ? OR products.kod like ? OR catalogue_sections.name like ?', '%'+params[:query]+'%', '%'+params[:query]+'%', '%'+params[:query]+'%'])).page params[:page]
    else
      @products = [] 
      @products = Product.where('name like ?', '%'+params[:name]+'%') if params[:name] && !params[:name].blank?
      @products |= Product.where('brand like ?', '%'+params[:brand]+'%') if params[:brand] && !params[:brand].blank?
      @products |= Product.where('kod like ?', '%'+params[:kod]+'%') if params[:kod] && !params[:kod].blank?

      @products |= Product.where('price > ? AND price < ?', params[:price_min], params[:price_max]) if params[:kod] && !params[:kod].blank?

      @products |= Product.where(Product.find(:all, :joins => :catalogue_section, :conditions => ['catalogue_sections.name like ?', '%'+params[:catalogue_sections]+'%'])) if params[:catalogue_sections] && !params[:catalogue_sections].blank?

      @products = Kaminari.paginate_array(@products).page params[:page]
    end        
  end
end
