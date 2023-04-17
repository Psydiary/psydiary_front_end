class Users::DailyLogEntriesController < ApplicationController

  def index

  end

  def show
    
  end

  def new
    @facade = DailyLogEntriesFacade.new(params)
  end

  def create
    daily_log_entry = DailyLogEntriesFacade.new(daily_log_entry_params).new_entry
    if daily_log_entry.is_a?(Array)
      flash[:error] = "Could not create user"
      redirect_to register_path
    else
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
end