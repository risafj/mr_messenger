class MessagesController < ApplicationController
  def create
    # new_message = Message.create
  end

  def delete; end

  private

  # Add create_return_json method

  def message_params
    params.require(:message).permit(:scheduled_date_time, :sender_number, :receiver_number, :content)
  end
end
