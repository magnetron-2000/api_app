class Authentication::SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:email], password: params[:password])

    if user
      render json: user.to_json(only: :token)
    else
      render status: :not_found
    end
  end
end