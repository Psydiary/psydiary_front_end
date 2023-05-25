class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    # @_current_user ||= PsydiaryFacade.new(id: session[:user_id]).user if session[:user_id]
    @_current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
end
