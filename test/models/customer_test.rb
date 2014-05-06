require 'test_helper'

class CustomerTest < ActiveSupport::TestCase

  test "it should successfully save" do
    customer = Customer.new(first_name:'test', last_name: 'test', email: 'a@b.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    assert customer.save, customer.errors.full_messages.join(', ')
  end

  test "name should not be blank" do
    customer = Customer.new(first_name:'', last_name: '', email:'a@b.com', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    refute customer.save
    assert_equal ['can\'t be blank'], customer.errors[:first_name]
  end

  test "email should not be blank" do
    customer = Customer.new(first_name:'brandon', last_name: 'closson', email: '', password: 'abcdefgh', password_confirmation: 'abcdefgh')
    refute customer.save
    assert customer.errors[:email].include? "can't be blank"
  end

  test "email should be unique" do
    Customer.create(first_name: "A", last_name: "Exampy", email: "a@test.com", password: 'abcdefgh', password_confirmation: 'abcdefgh')
    c = Customer.new(first_name: "B", last_name: "Exampy", email: "a@test.com", password: 'abcdefgh', password_confirmation: 'abcdefgh')
    refute c.save
    assert_equal ["has already been taken"],
      c.errors[:email]
  end

end