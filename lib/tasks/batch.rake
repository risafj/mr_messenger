require_relative '../../config/initializers/twilio'

namespace :batch do
  desc 'Send batch messages; update sent column'
  task send_messages: :environment do
    include TwilioClient
    batch_messages = Message.where(sent_date_time: nil).where('scheduled_date_time <?', DateTime.current)

    batch_messages.count.times do |n|
      twilio_client.messages.create(
        from: batch_messages[n].sender_number,
        to: batch_messages[n].receiver_number,
        body: batch_messages[n].content
      )
    end
  end
end
