class UsersController < ApplicationController
  def new
  end

  def create
    user = UserService.create_user(user_params)
    require 'pry'; binding.pry
    # if user.save
    #   session[:user_id] = user.id
    #   redirect_to user_path(user)
    # else
    #   flash[:error] = "Please fill out all fields."
    #   redirect_to new_user_path
    # end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address)
  end
end