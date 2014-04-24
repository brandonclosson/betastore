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
  has_secure_password
  before_save { email.downcase! }
  before_create :create_remember_token
  validates_presence_of :first_name, :last_name, :email,
                        :password, :password_confirmation
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(?:\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true,
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 8 }

  def self.verify(token)
    customer_id = Rails.application.message_verifier('customer').verify(token)
    customer = Customer.find(customer_id)
    customer.update_attribute(:verified_at, Time.current) unless customer.verified_at
    customer
  rescue => ex
    logger.error "Could not verify user: #{ex.class} #{ex.message}"
  end

  def send_verification_email
    CustomerMailer.welcome(self).deliver
  end

  def self.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def self.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def full_name
    first_name + " " + last_name
  end

  protected

    def create_remember_token
      self.remember_token = Customer.digest(Customer.new_remember_token)
    end
end
