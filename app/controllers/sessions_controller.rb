class SessionsController < ApplicationController
  def create
    user = UserFacade.create_user(user_params)
    session[:user] = user.raw_data
    create_info = session[:user]
    create_info[:google_id] = create_info[:uid]
    UserFacade.create_user(create_info)

    redirect_to root_path
  end

  def delete
    session[:user] = nil
    redirect_to root_path
  end

  private

  def user_params
    request.eenv['omniauth.auth']
  end
end