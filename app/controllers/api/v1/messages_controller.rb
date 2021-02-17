class Api::V1::MessagesController < ApplicationController

  def create
    message = Message.create(message_params)
    render json:MessageSerializer.new(message)
  end

  private

  def message_params
    params.permit(:content, :sender_id, :recipient_id)
  end 
end
