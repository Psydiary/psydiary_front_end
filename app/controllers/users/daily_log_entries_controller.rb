class Users::DailyLogEntriesController < ApplicationController

  def index

  end

  def show
    @daily_log_entry = DailyLogEntry.find(params[:id])
  end

  def new
    @daily_log_entry = DailyLogEntry.new(user_id: params[:user_id])
  end

  def create
    daily_log_entry = DailyLogEntry.new(daily_log_entry_params)
    if daily_log_entry.save
      redirect_to user_path(params[:user_id]) 
    else
      flash[:error] = "Could not create entry"
      redirect_to user_path(params[:user_id])
    end
  end

  private

    def daily_log_entry_params
      params.permit(:id,
                    :mood, 
                    :sleep_score, 
                    :anxiety_score, 
                    :depression_score, 
                    :energy_levels, 
                    :sociability, 
                    :meditation, 
                    :exercise, 
                    :notes, 
                    :user_id)
    end

    def facade
      @facade ||= DailyLogEntryFacade.new
    end
end