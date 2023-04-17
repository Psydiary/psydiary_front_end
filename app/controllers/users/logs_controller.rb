class Users::LogsController < ApplicationController

  def index

  end

  def show
    @daily_log_entry = facade.daily_log_entry(params[:user_id], params[:id])
  end

  def new

  end

  def create

  end

  private

  def facade
    @facade ||= DailyLogEntryFacade.new
  end
end