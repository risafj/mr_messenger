class Message < ApplicationRecord
  validates :scheduled_date_time, :sender_number, :receiver_number, :content, presence: true
  validates :content, length: { minimum: 2, maximum: 100 }

  # Adding callback to verify that sender/receiver numbers are actually numbers beginning with +.
  # ASK - Method doesn't work yet, as data can be saved to db even if the sender number doesn't match regex, like "abc".
  before_save :check_sender_num_validity

  private

  def check_sender_num_validity
    data_check = /^\+\d+$/.match(sender_number)
    throw :abort if data_check.blank?
  end
end
