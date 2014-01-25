require 'test_helper'

class StaticPagesControllerTest < ActionController::TestCase
  test "should get intro1" do
    get :intro1
    assert_response :success
  end

  test "should get intro2" do
    get :intro2
    assert_response :success
  end

  test "should get intro3" do
    get :intro3
    assert_response :success
  end

  test "should get intro4" do
    get :intro4
    assert_response :success
  end

  test "should get intro5" do
    get :intro5
    assert_response :success
  end

end
