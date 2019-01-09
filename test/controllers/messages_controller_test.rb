require 'test_helper'

class MessagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    Rails.application.load_seed
  end

  test 'should create message' do
    post '/messages/', params: {
      message: {
        scheduled_date_time: '2019-01-10 22:00:00',
        sender_number: '+123456789',
        receiver_number: '+987654321',
        content: 'controller test'
      }
    }
    assert_response :success
    assert response.body.include? 'id'
  end

  test 'should delete message' do
    assert_not Message.first.id.nil?
    delete "/messages/#{Message.first.id}/"
    assert_response :success
  end

  test 'delete request should return status 400 if id does not exist' do
    assert Message.where(id: '99999').blank?
    delete '/messages/99999/'
    assert_response :bad_request
  end
end
