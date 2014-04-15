require 'test_helper'

class CreateSubscriptionTest < ActionDispatch::IntegrationTest

  def test_create_subscription
    visit "/"
    fill_in "Find out when we go live", with: "bclosson@gmail.com"
    click_on "Sign Up"
    assert page.has_content?("Subscription was successfully created.")
    assert_equal 'bclosson@gmail.com', Subscription.last.email
  end

end