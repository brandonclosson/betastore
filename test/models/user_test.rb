require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "it should authenticate with matching username and password" do
    user = User.create!(:email => 'test@example.com', password: 'secret')
    assert_equal User.find_by_email('test@example.com').try(:authenticate, 'secret'), user
  end
end
