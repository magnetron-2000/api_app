class Authentication::RegistrationsController < ApplicationController
  def create
    user = User.create(user_params)

    render json: user.to_json(only: :token)
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end