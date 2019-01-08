class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_message = Message.create(
      scheduled_date_time: message_params[:scheduled_date_time],
      sender_number: message_params[:sender_number],
      receiver_number: [:receiver_number],
      content: message_params[:content]
    )

    render json: create_return_json(new_message, 'Message successfully scheduled')
  end

  def delete; end

  private

  def create_return_json(error_check_object, success_message)
    error_check_object.errors.messages.presence ? error_check_object.errors.messages : { message: success_message }
  end

  def message_params
    params.require(:message).permit(:scheduled_date_time, :sender_number, :receiver_number, :content)
  end
end
