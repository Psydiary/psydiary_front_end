class UsersController < ApplicationController
  def new
    
  end
  
  def create
    user = PsydiaryFacade.new(user_params).new_user
    session[:user_id] = user.id
    require 'pry'; binding.pry
    redirect_to "/users/#{user.id}" 
  end

  def show
    
  end

  def login

  end

  private
  def user_params
    params.permit(:name, :email, :password, :protocol_id, :ip_address)
  end
end