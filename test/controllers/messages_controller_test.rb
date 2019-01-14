require 'test_helper'
require_relative '../helpers/authorization_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  include AuthorizationHelper

  def setup
    test_user = { email: 'user@test.com', password: 'testuser' }
    sign_up(test_user)
    @auth_headers = get_auth_headers(test_user)
  end

  test 'should create message' do
    post '/messages/',
         params: {
           message: {
             scheduled_date_time: '2019-01-10 22:00:00',
             sender_number: '+123456789',
             receiver_number: '+987654321',
             content: 'controller test'
           }
         },
         headers: @auth_headers

    assert_response :success
    assert JSON.parse(response.body)['id'].present? && JSON.parse(response.body)['message'].present?
  end

  test 'should delete message' do
    # Seeds have been loaded, so Message.first should not be nil.
    assert_not Message.first.nil?
    delete "/messages/#{Message.first.id}/", headers: @auth_headers
    assert_response :success
  end

  test 'delete request should return status 400 if id does not exist' do
    assert Message.where(id: '9999999').blank?
    delete '/messages/9999999/', headers: @auth_headers
    assert_response :bad_request
  end
end
