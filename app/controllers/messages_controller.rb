class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_message = Message.new(
      scheduled_date_time: message_params[:scheduled_date_time],
      sender_number: message_params[:sender_number],
      receiver_number: message_params[:receiver_number],
      content: message_params[:content]
    )

    if new_message.save
      render json: { message: 'Message successfully scheduled' }
    else
      render json: new_message.errors.messages, status: :bad_request
    end
  end

  def delete
    # message_to_delete = ...
  end

  private

  def message_params
    params.require(:message).permit(:scheduled_date_time, :sender_number, :receiver_number, :content)
  end
end
