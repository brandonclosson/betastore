require 'test_helper'

class LineItemTest < ActiveSupport::TestCase

  test "it should save" do
    line_item = LineItem.new(
      order: orders(:cheap),
      product: products(:hat),
      quantity: 1)
    assert line_item.save,
      line_item.errors.full_messages.join(', ')
  end

  test "it should fail without quantity" do
    line_item = LineItem.new(
      order: orders(:cheap),
      product: products(:hat))
    refute line_item.save
    assert_equal ['can\'t be blank'],
      line_item.errors[:quantity]
  end

  test "it should fail with 0 quantity" do
    line_item = LineItem.new(
      order: orders(:cheap),
      product: products(:hat),
      quantity: 0)
    refute line_item.save
    assert_equal ['must be greater than 0'],
      line_item.errors[:quantity]
  end

  test "it should fail without product_id" do
    line_item = LineItem.new(
      order: orders(:cheap),
      quantity: 1)
    refute line_item.save
    assert_equal ['can\'t be blank'],
      line_item.errors[:product_id]
  end
end