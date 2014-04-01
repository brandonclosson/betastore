# == Schema Information
#
# Table name: credit_cards
#
#  id              :integer          not null, primary key
#  customer_id     :integer
#  card_number     :string(255)
#  expiration_date :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class CreditCard < ActiveRecord::Base
  belongs_to :customer

  validates_presence_of :customer_id, :card_number, :expiration_date
  validates :card_number, format: { with: /\A\d{15,16}\z/, allow_blank: true }
  validate :validate_expiration_date

  def expires_at
    @expires_at || Date.strptime(expiration_date, '%m/%Y') + 1.month
  end

  def validate_expiration_date
    if expiration_date.blank?
      errors.add(:expiration_date, 'is required')
    elsif expiration_date !~ /\A\d{2}\/\d{4}\z/
      errors.add(:expiration_date, 'should be in the format MM/YYYY')
    elsif expires_at < Time.current
      errors.add(:expiration_date, 'has expired')
    end
  end
  
end
