require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get user_images" do
    get :user_images
    assert_response :success
  end

end
