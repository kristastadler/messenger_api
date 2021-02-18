class Api::V1::MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    if message.sender != nil && message.recipient != nil
      render json: MessageSerializer.new(message)
    else
      create_error = {
        "error_message" => "Oops, looks like at least one of those users doesn't exist!"
      }
      render json: create_error, status: 404
    end
  end

  private

  def message_params
    params.permit(:content, :sender_id, :recipient_id)
  end
end
