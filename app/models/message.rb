class Message < ApplicationRecord
  validates :scheduled_date_time, :sender_number, :receiver_number, :content, presence: true
  validates :content, length: { minimum: 2, maximum: 100 }

  before_save :check_numbers_validity

  private

  def check_numbers_validity
    sender_check = /^\+\d+$/.match(sender_number)
    # If command line says 'rollback transaction' when you try to save, it means the throw abort is working.
    throw :abort if sender_check.blank?
    receiver_check = /^\+\d+$/.match(receiver_number)
    throw :abort if receiver_check.blank?
  end
end
