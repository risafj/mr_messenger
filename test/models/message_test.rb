require 'test_helper'

class MessageTest < ActiveSupport::TestCase
  test 'message is not saved if required fields are blank' do
    message = Message.new(
      scheduled_date_time: '2019-01-10 22:00:00',
      sender_number: '+123456789',
      receiver_number: '+987654321'
    )
    assert_not message.save

    message.update(content: 'hiya')
    assert message.save
  end

  # test 'message is not saved if too long' do

  # end
end
