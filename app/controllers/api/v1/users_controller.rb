class Api::V1::UsersController < ApplicationController

  def create
    user = User.create(permitted_params)
    render json: UserSerializer.new(user)
  end

  private

  def permitted_params
    params.permit(:username)
  end

end
