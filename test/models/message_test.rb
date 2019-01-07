require 'test_helper'
require_relative '../helpers/message_helper'

class MessageTest < ActiveSupport::TestCase
  include MessageHelper

  test 'message is not saved if required fields are blank' do
    message = message_content_missing
    assert_not message.save

    message.update(content: 'hiya')
    assert message.save
  end

  test 'message is not saved if longer than 100 characters' do
    message = message_content_missing
    message.update(content:
      'I need more than one hundred characters in this test message so that it cannot be saved in the database.')

    assert_not message.save

    message.update(content: 'This should be short enough.')
    assert message.save
  end
end
