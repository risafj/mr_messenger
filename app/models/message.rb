class Message < ApplicationRecord
  validates :scheduled_date_time, :sender_number, :receiver_number, :content, presence: true
  # validates :sender_number, :receiver_number, length: { minimum: ?, maximum: ? }
  validates :content, length: { minimum: 2, maximum: 100 }
end
