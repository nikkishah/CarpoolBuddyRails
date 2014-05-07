require 'test_helper'

class StaticControllerTest < ActionController::TestCase
  test "should get help" do
    get :help
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
