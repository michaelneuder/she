# Who:
Alex Urbanski
Michael Neuder
Nick Zimmerer
Bum Kim
Nischay Murthy

# Title:
SHE

# Vision:
1. The freedom of being single, with the social status of being taken.
2. To give users the appearance of having a significant other, and provide companionship to them.

# Automated Tests:

To run automated tests. Go into the she/web_app/she_app directory 
run from the command line 
```
$ rails t
```
The code is at she/web_app/she_app/test/models/user_test.rb and is as follows
```ruby
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
```
The results of running the tests in the terminal is 
```
Running via Spring preloader in process 6447
Run options: --seed 20010

# Running:

..........

Finished in 0.173933s, 57.4933 runs/s, 57.4933 assertions/s.

10 runs, 10 assertions, 0 failures, 0 errors, 0 skips
```
So all of the tests pass like they should.

# User Acceptance Tests:

TEST 1
Login to She
    Verify login with valid user name and password
Description
    Test the login page for She
Pre-conditions
    User has valid user name and password
Test steps
    1. Navigate to login page with She app URL
    2. Provide valid user name
    3. Provide valid password
    4. Click login button
Expected result
    User should be able to login
Actual result
    User is navigated to dashboard with successful login
Status (Pass/Fail)
    Pass
Notes
    N/A
Post-conditions
    User is validated with database and successfully signed into their account.
    The account session details are logged in database.
    
TEST 2
Chat with girlfriend
    Chat with girlfriend using chat box 
Description
    Test chat box, carry out conversation with girlfriend, and exit
Pre-conditions
    User has valid user name and password
    User is logged into She account
Test steps
    1. Click on chat box tab
    2. Type in chat message and hit Enter
    3. Continue conversation with girlfriend
    4. Click exit button
Expected result
    User should be able to chat with girlfriend and exit 
Actual result
    User has conversation with girlfriend and exits chat box 
Status (Pass/Fail)
    Pass
Notes
    N/A
Post-conditions
    User is satisfied with conversation and is redirected back to the She home page after exiting chat box
    
TEST 3
Facebook test
    Carry out facebook functionalities with girlfriend
Description
    Test the facebook API
Pre-conditions
    User has valid user name and password for She
    User is logged into She app
Test steps
    1. Navigate to Facebook tab
    2. Provide valid user name and password for Facebook
    3. Post an update on Facebook
    4. Log out of Facebook
Expected result
    Girlfriend should like the post
    Should exit to the She home screen
Actual result
    Girlfriend account likes the user's post on Facebook
    Application exits to home screen
Status (Pass/Fail)
    Pass
Notes
    N/A
Post-conditions
    Facebook post has girlfriend's like on it
    User is on the She home screen
