class Admin::BaseController < ApplicationController
  def authenticate_user!
    @user = User.find_by(token: params[:token])

    render status: :unauthorized unless @user
    set_current_company
  end

  def current_user
    @user
  end

  def set_current_company
    @current_company = user.company
  end

  def current_company
    @current_company
  end
end