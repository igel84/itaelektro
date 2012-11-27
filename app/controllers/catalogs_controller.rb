class CatalogsController < ApplicationController
  def index
    @catalogue_sections = CatalogueSection.includes
    @products= Product.all
  end

  def show
    @catalogue_section = CatalogueSection.includes(:products).find(params[:id])
    @products = @catalogue_section.products.page params[:page]
  end
end
