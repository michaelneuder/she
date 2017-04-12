require 'test_helper'

class FacebookControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get facebook_index_url
    assert_response :success
  end

end
