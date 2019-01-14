require 'test_helper'
require_relative 'helpers/authorization_helper'

class AuthorizationTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper
  test 'sign up user' do
    sign_up(email: 'signup@test.com', password: 'signup_password')
    assert_response :success
  end

  test 'sign up and log in user one' do
    user_one = { email: 'userone@test.com', password: 'userone' }
    sign_up(user_one)
    assert_response :success

    get_auth_headers(user_one)
    assert_response :success
  end
end
