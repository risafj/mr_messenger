require_relative '../../config/initializers/twilio'

namespace :batch do
  desc 'Send batch messages; update sent column'
  task send_messages: :environment do
    batch_messages = Message.where(sent_date_time: nil).where('scheduled_date_time < ?', DateTime.current)

    batch_messages.each do |message|
      TwilioClient.messages.create(
        from: message.sender_number,
        to: message.receiver_number,
        body: message.content
      )
    end

    batch_messages.update_all(sent_date_time: DateTime.current)
  end
end
