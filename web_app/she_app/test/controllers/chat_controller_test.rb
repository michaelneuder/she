require 'test_helper'

class ChatControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chat_index_url
    assert_response :success
  end

  test "should get cleverbot" do
    get chat_clev_url
    assert_response :success
  end
end
