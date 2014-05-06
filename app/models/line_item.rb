# == Schema Information
#
# Table name: line_items
#
#  id         :integer          not null, primary key
#  order_id   :integer
#  product_id :integer
#  quantity   :integer
#  price      :decimal(, )
#  created_at :datetime
#  updated_at :datetime
#

class LineItem < ActiveRecord::Base

  belongs_to :order, inverse_of: :line_items
  belongs_to :product

  validates_presence_of :order, :product_id, :quantity
  validates :quantity, numericality: { greater_than: 0, allow_blank: true }

  before_save :set_price
  after_save :increment_order_total_amount

  def set_price
    self.price = product.price
  end

  def subtotal
    price * quantity
  end

  def increment_order_total_amount
    order.increment_total_amount(subtotal)
  end

end
