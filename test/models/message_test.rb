require 'test_helper'

# Don't actually run this test
test 'save code' do
  client = Twilio::REST::Client.new
  client.messages.create(
    from: Rails.application.credentials.twilio_phone_number,
    to: '+818053800431',
    body: 'Hello there! This is a test'
  )
end
