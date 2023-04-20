class UsersController < ApplicationController
  def new
    @facade = ProtocolFacade.new(params)
    @ip_address = request.remote_ip
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

  def log_entries
    if session[:user_id] == params[:user_id]
      params[:id] = params[:user_id]
      @facade = PsydiaryFacade.new(params)
    else 
      redirect_to root_path
      flash[:notice] = "You must be logged in and registered to view this page"
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

  def edit
    user = PsydiaryFacade.new(user_params).edit_user
    if session[:user_id] == params[:user_id]
      if user.nil?
        flash[:error] = user.errors.full_messages
        redirect_to user_path(session[:user_id])
      else
        @user = user
      end
    else
      redirect_to root_path
      flash[:notice] = "You must be logged in and registered to view this page"
    end
  end

  def logout
    session.delete(:user_id)
    current_user = nil
    redirect_to root_path
  end

  def omniauth
    user = PsydiaryFacade.from_omniauth('73.153.161.252', request.env['omniauth.auth'])
    if !user.is_a?(User)
      flash[:error] = user[:errors]
      redirect_to login_path
    else
      session[:user_id] = user.id
      redirect_to user_path(user.id) 
    end
  end

  def update_protocol
    if current_user.id == params[:user_id]
      PsydiaryFacade.new(params).update_user_protocol
      redirect_to user_protocols_path(params[:user_id])
    else
      redirect_to root_path
      flash[:notice] = "You must be logged in and registered to view this page"
    end
  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address, :data_sharing, :user_id)
  end
end