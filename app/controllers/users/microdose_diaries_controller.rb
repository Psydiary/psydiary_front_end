class Users::MicrodoseDiariesController < ApplicationController
  def index

  end

  def show
    # user = User.find_by(id: session[:user_id])
    # user = User.find(params [:user_id])
    @microdose_log_entry = facade.one_microdose_log_entry(params[:user_id], params[:id])
  end

  def new

  end

  def create

  end

  private

  def facade
    @facade ||= MicrodoseLogEntryFacade.new
  end

end