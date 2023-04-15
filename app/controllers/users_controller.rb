class UsersController < ApplicationController
  def new
  end

  def create
    user = UserService.create_user(user_params)
    redirect_to user_path(user)
  end

  def show
    
  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address)
  end
end