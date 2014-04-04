require 'test_helper'

class SubscriptionsControllerTest < ActionController::TestCase
  def test_new
    get :new
    assert_response :success
  end
end