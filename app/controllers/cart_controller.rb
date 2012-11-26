class CartController < ApplicationController

  def index
    
  end

  def add_to_cart(product=params[:cart_item][:product_id], quantity=params[:cart_item][:quantity])
    @cart = find_cart
    @product = Product.find product
    @cart.add_product(@product, quantity)
    redirect_to :back
  end

  def conversion
    @cart.conversion(Product.find(params[:product]), params[:quantity])
    redirect_to :back
  end

  def destroy_cart_item
    @cart.destroy_item(params[:product])    
    if @cart.items == []
      redirect_to :root
    else
      redirect_to :back    
    end
  end

end
