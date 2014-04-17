# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Customer < ActiveRecord::Base
  has_many :orders
  has_many :credit_cards
  has_secure_password validations: false

  validates_presence_of :first_name, :last_name
  validates :email, presence: true, uniqueness: true

  def self.verify(token)
    customer_id = Rails.application.message_verifier('customer').verify(token)
    customer = Customer.find(customer_id)
    customer.update!(verified_at: Time.current) unless customer.verified_at
    customer
  rescue
    nil
  end
end
