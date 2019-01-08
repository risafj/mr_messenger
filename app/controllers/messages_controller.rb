class MessagesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    new_message = Message.new(
      scheduled_date_time: message_params[:scheduled_date_time],
      sender_number: message_params[:sender_number],
      receiver_number: [:receiver_number],
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

  # def create_return_json(error_check_object, success_message)
  #   if error_check_object.errors.messages.presence
  #     error_check_object.errors.messages, status: :bad_request
  #   else { message: success_message }
  #   end
  # end

  def message_params
    params.require(:message).permit(:scheduled_date_time, :sender_number, :receiver_number, :content)
  end
end
