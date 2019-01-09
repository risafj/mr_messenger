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
      render json: {
        id: new_message.id,
        message: 'Your message has been scheduled successfully.'
      }
    else
      render json: new_message.errors.messages, status: :bad_request
    end
  end

  def delete
    message_to_delete = Message.find(params[:id])
    if message_to_delete.destroy
      render json: { message: 'Your message has been deleted successfully.' }
    else
      render json: message_to_delete.errors.messages, status: :bad_request
    end
  end

  private

  def message_params
    params.require(:message).permit(:scheduled_date_time, :sender_number, :receiver_number, :content)
  end
end
