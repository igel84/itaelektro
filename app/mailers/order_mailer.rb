class OrderMailer < ActionMailer::Base
  default from: 'support@itaelektro.com'

  def order_email(order)
    @order = order
    mail(to: ['support@itaelektro.com', order.email], subject: 'order success')
  end

end