class OrdersController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    if params[:email]
      @order = Order.new
      @order.body = @cart.to_s
      @order.email = params[:email]
      @order.delivery_id =  params[:order][:delivery_id]
      @order.save!
      OrderMailer.order_email(@order).deliver
      @cart.empty!
      render :action => "success"
      #redirect_to new_order_path
    else
      @order = Order.new(params[:order])
      @order.user_id = current_user.id if current_user
      @order.body = @cart.to_s
      @order.ip_address = request.remote_ip
      if @order.save
        OrderMailer.order_email(@order).deliver
        if @order.purchase(@cart)
          @cart.empty!
          render :action => "success"
        else
          render :action => "failure"
        end
      else
        render :action => 'new'
      end
    end
  end
end