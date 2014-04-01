require 'test_helper'
require 'minitest/pride'

class CustomerTest < ActiveSupport::TestCase

  test "it should successfully save" do
    customer = Customer.new(name:'test', email: 'a@b.com')
    assert customer.save, customer.errors.full_messages.join(', ')
  end

  test "name should not be blank" do
    customer = Customer.new(name:'', email:'a@b.com')
    refute customer.save
    assert_equal ['can\'t be blank'], customer.errors[:name]
  end

  test "email should not be blank" do
    customer = Customer.new(name:'brandon', email: '')
    refute customer.save
    assert_equal ['can\'t be blank'], customer.errors[:email]
  end

  test "email should be unique" do
    Customer.create(name: "A", email: "a@test.com")
    c = Customer.new(name: "B", email: "a@test.com")
    refute c.save
    assert_equal ["has already been taken"],
      c.errors[:email]
  end

end