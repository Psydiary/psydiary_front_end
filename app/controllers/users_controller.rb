class UsersController < ApplicationController
  def new
    
  end
  
  def create
    user = PsydiaryFacade.new(user_params).new_user
      if user.is_a?(Array)
        flash[:error] = "Could not create user"
        redirect_to register_path
      else
        session[:user_id] = user.id
        redirect_to user_path(user.id) 
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