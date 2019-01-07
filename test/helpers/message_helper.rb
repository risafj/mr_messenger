module MessageHelper
  def message_content_missing
    Message.new(
      scheduled_date_time: '2019-01-10 22:00:00',
      sender_number: '+123456789',
      receiver_number: '+987654321'
    )
  end
end
