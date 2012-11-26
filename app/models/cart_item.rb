class CartItem
  attr_reader :product, :quantity

  def initialize(product, quantity=1)
    @product = product
    @quantity = quantity.to_i
  end

  def increment_quantity(quantity)
    @quantity += quantity.to_i
  end

  def set_quantity(quantity)
    @quantity = quantity.to_i
  end

  def name
    @product.name
  end

  def price
    (@product.price) * @quantity
  end

end
