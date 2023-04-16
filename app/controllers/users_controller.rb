class UsersController < ApplicationController
  def new
    
  end
  
  def create
    user = PsydiaryFacade.new(user_params).new_user
      # require 'pry'; binding.pry
      if user
        session[:user_id] = user.id
        redirect_to user_path(user.id) 
      else
        flash[:error] = "Could not create user"
        redirect_to register_path
      end
  end

  def show
    
  end

  def login

  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address, :data_sharing)
  end
end