class OrderTransaction < ActiveRecord::Base
  attr_accessible :order_id, :action, :amount, :success, :authorization, :message, :params, :response
  belongs_to :order
  serialize :params
  
  def response=(response)
    self.success       = response.success?
    self.authorization = response.authorization
    self.message       = response.message
    self.params        = response.params
  rescue ActiveMerchant::ActiveMerchantError => e
    self.success       = false
    self.authorization = nil
    self.message       = e.message
    self.params        = {}
  end
end