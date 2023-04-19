class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @_current_user ||= PsydiaryFacade.new(id: session[:user_id]).user if session[:user_id]
  end
end
