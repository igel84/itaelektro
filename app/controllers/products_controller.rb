class ProductsController < ApplicationController
  def show
    @product = Product.includes(:catalogue_section).find params[:id]
  end
end
