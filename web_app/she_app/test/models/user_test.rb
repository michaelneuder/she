require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user1 = User.new(name: "Fake User", email: "fakkkemail@yahoo.com",
                      password: "password", password_confirmation: "password",
                      twitter_handle: "AlexUrbanski")
    @user2 = User.new(name: "fdsa{$@}", email: "fakkkhoo.com",
                      password: "pas", password_confirmation: "pass",
                      twitter_handle: "asd")
  end

  test "does_it_work" do
    assert true;
  end

  test "is_valid" do
    assert @user1.valid?
  end

  test "is_not_valid" do
    assert_not @user2.valid?
  end

  test "name_not_present" do
    @user1.name = "     "
    assert_not @user1.valid?
  end

  test "name_present" do
    @user1.name = "Sophie Ekaf"
    assert @user1.valid?
  end

  test "password_not_present" do
    @user1.password = @user1.password_confirmation = " " * 6
    assert_not @user1.valid?
  end

  test "password_present" do
    @user1.password = @user1.password_confirmation = "paassword"
    assert @user1.valid?
  end

  test "password_not_long" do
    @user1.password = "er"
    assert_not @user1.valid?
  end

  test "email_not_valid" do
    @user1.email = "notAnEmail"
    assert_not @user1.valid?
  end

  test "email_valid" do
    @user1.email = "email@email.com"
    assert @user1.valid?
  end
end
