require 'test_helper'

class OrderTest < ActiveSupport::TestCase

  test "it should save successfully" do
    order = customers(:brandon).orders.build(
      credit_card: credit_cards(:brandon_visa))
    assert order.save,
      order.errors.full_messages.join(', ')
  end
end

