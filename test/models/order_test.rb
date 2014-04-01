require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "it should save successfully" do
    order = customers(:brandon).orders.build(
      credit_card: credit_cards(:brandon_visa))
    assert order.save,
      order.errors.full_messages.join(', ')
  end

  test "it should not save without credit card" do
    order = customers(:brandon).orders.build
    refute order.save
    assert_equal ['can\'t be blank'],
      order.errors[:credit_card_id]
  end
  
end

