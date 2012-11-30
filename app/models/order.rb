class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :delivery
  has_many :transactions, :class_name => "OrderTransaction"
  
  attr_accessor :card_number, :card_verification
  attr_accessible :delivery_id, :email, :card_number, :card_verification, :user_id, :ip_address, :first_name, :last_name, :card_type, :card_expires_on, :body, :city, :state, :country, :address1, :zip
  
  validate :validate_card, on: :create
  
  def purchase(cart)
    response = GATEWAY.purchase((cart.full_price).round, credit_card, purchase_options)
    transactions.create!(:action => "purchase", :amount => (cart.full_price).round, :response => response)
    response.success?
  end
  
  private
  
  def purchase_options
    {
      :ip => ip_address,
      :billing_address => {
        :name     => "Ryan Bates",
        :address1 => "123 Main St.",
        :city     => "New York",
        :state    => "NY",
        :country  => "US",
        :zip      => "10001"
      }
    }
  end
  
  def validate_card
    if !card_number.blank?
      unless credit_card.valid?
        credit_card.errors.full_messages.each do |message|
          errors[:base] << message
        end
      end
    end
  end
  
  def credit_card
    @credit_card ||= ActiveMerchant::Billing::CreditCard.new(
      :type               => card_type,
      :number             => card_number,
      :verification_value => card_verification,
      :month              => card_expires_on.month,
      :year               => card_expires_on.year,
      :first_name         => first_name,
      :last_name          => last_name
    )
  end
end