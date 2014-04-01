require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  test "it should save successfully" do
    product = Product.new(name: 'Test', price: 9.99)
    assert product.save,
      product.errors.full_messages.join(', ')    
  end

  test "it should not save without price" do
    product = Product.new(name: 'Test')
    refute product.save
    assert_equal ['can\'t be blank'],
      product.errors[:price]
  end

  test "it should not save with price 0" do
    product = Product.new(name: 'Test', price: 0)
    refute product.save
    assert_equal ['must be greater than 0'],
      product.errors[:price]
  end

  test "it should not save without name" do
    product = Product.new(price: 9.99)
    refute product.save
    assert_equal ['can\'t be blank'],
      product.errors[:name]
  end
  
end