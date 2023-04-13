class UsersController < ApplicationController
  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to user_path(user)
    else
      flash[:error] = "Please fill out all fields."
      redirect_to new_user_path
    end
  end
end