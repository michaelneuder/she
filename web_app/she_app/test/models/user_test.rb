require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = User.new(name: "Fake User", email: "fakkkemail@yahoo.com",
                      password: "password", password_confirmation: "password",
                      twitter_handle: "AlexUrbanski")
  end

  test "should be valid" do
    assert @user1.valid?
  end

  test "name should be present" do
    @user1.name = "     "
    assert_not @user1.valid?
  end

  test "password should be present" do
    @user1.password = @user1.password_confirmation = " " * 6
    assert_not @user1.valid?
  end

end
