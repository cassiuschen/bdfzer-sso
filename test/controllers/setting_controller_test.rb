require 'test_helper'

class SettingControllerTest < ActionController::TestCase
  test "should get user" do
    get :user
    assert_response :success
  end

  test "should get extra" do
    get :extra
    assert_response :success
  end

  test "should get application" do
    get :application
    assert_response :success
  end

end
