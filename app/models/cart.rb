class Cart
  attr_reader :items

  def initialize
    @items = []
  end

  def paypal_url(return_url)
    values = {
      :business => 'seller_1229899173_biz@railscasts.com',
      :cmd => '_cart',
      :upload => 1,
      :return => return_url,
      :invoice => 2
    }
    @items.each_with_index do |item, index|
      values.merge!({
        "amount_#{index+1}" => item.price,
        "item_name_#{index+1}" => item.name,
        "item_number_#{index+1}" => index,
        "quantity_#{index+1}" => item.quantity
      })
    end
    "https://www.sandbox.paypal.com/cgi-bin/webscr?" + values.to_query
  end

  def add_product(product, quantity=1)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.increment_quantity(quantity)
    else
      @items << CartItem.new(product, quantity)
    end
  end

  def price
    @items.sum{ |item| item.price }
  end

  def full_price
    tax = Product.tax
    @items.sum{ |item| item.price + item.price * tax }
  end

  def quantity
    @items.sum{ |item| item.quantity }
  end

  def conversion(product, product_quantity=1)
    current_item = @items.find { |item| item.product == product }
    if current_item
      current_item.set_quantity(product_quantity)
    else
      @items << CartItem.new(product, product_quantity)
    end
  end

  def destroy_item(product)
    @items.delete_if { |item| item.product.id == product.to_i }
  end

  def to_s
    str = ''
    @items.each do |item|
      str << "product - #{Product.find(item.product).name}, quantity - #{item.quantity.to_s}, price - #{item.price.to_s}\n"
    end
    str << "\n\n total price - #{self.price}"
    str << "\n tax - #{Product.tax}"
    str << "\n price with tax - #{self.full_price}"
    str
  end

  def empty!
    @items.delete_if { |i| true }
  end

end
