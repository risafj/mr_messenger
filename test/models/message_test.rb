require 'test_helper'
require_relative '../helpers/message_helper'

class MessageTest < ActiveSupport::TestCase
  include MessageHelper

  test 'does not save if required fields are blank' do
    message = invalid_message_no_content
    assert_not message.save

    message.update(content: 'hiya')
    assert message.save
  end

  test 'does not save if longer than 100 characters' do
    message = invalid_message_no_content
    message.update(content: 'a' * 101)

    assert_not message.save

    message.update(content: 'This should be short enough.')
    assert message.save
  end

  test 'does not save if sender/receiver numbers are not actual numbers starting with plus' do
    incorrect_number_msg = Message.new(
      scheduled_date_time: '2019-01-10 22:00:00',
      sender_number: 'abc',
      receiver_number: '+987654321',
      content: 'terry folds'
    )
    assert_not incorrect_number_msg.save

    incorrect_number_msg.update(sender_number: '+123456789')
    incorrect_number_msg.update(receiver_number: 'abc')
    assert_not incorrect_number_msg.save

    incorrect_number_msg.update(receiver_number: '987654321')
    assert_not incorrect_number_msg.save

    incorrect_number_msg.update(receiver_number: '+987654321')
    assert incorrect_number_msg.save
  end
end
