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
    if session[:user_id] == params[:id]
      @facade = PsydiaryFacade.new(params)
    else 
      redirect_to root_path
      flash[:notice] = "You must be logged in and registered to view your dashboard"
    end
  end

  def login_form
  end

  def login
    user = PsydiaryFacade.new(user_params).authenticate_user
    
    if user.nil?
      flash[:error] = "Incorrect email or password"
      redirect_to login_path
    else
      session[:user_id] = user.id
      flash[:success] = "Welcome, #{user.name}!"
      redirect_to user_path(user.id)
    end
  end

  def logout
    session.delete(:user_id)
    current_user = nil
    redirect_to root_path
  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address, :data_sharing)
  end
end