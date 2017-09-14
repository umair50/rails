require 'test_helper'

class WelcomeControllerTest < ActionDispatch::IntegrationTest
  test "should get indess" do
    get welcome_indess_url
    assert_response :success
  end

end
