class Api::V1::MessagesController < ApplicationController

  def index
    messages = Message.get_messages_from_all_senders(params[:limit])
    render json: MessageSerializer.new(messages)
  end

  def show
    recipient = User.find(params[:recipient_id])
    messages = recipient.sender_specific_messages(params[:sender], params[:limit])
    render json: MessageSerializer.new(messages)
  end

  def create
    message = Message.create(permitted_params)
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

  def permitted_params
    params.permit(:content, :sender_id, :recipient_id)
  end
end
