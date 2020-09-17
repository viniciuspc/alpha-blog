require 'test_helper'

class SignUpUserTest < ActionDispatch::IntegrationTest
  test "get signup form and create uer" do
    get "/signup"
    assert_response :success
    assert_difference "User.count", 1 do
      post users_path, params: { user: {username: "johndoe", email: "johndoe@example.com", password: "password"}}
      assert_response :redirect
    end
    follow_redirect!
    assert_response :success
    assert_match "johndoe", response.body
  end
end
