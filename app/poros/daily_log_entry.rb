class DailyLogEntry
  attr_reader :id,
              :mood, 
              :sleep_score, 
              :anxiety_score, 
              :depression_score, 
              :energy_levels, 
              :sociability, 
              :meditation, 
              :exercise, 
              :notes, 
              :user_id

  def initialize(daily_log_params)
    @id = daily_log_params[:id]
    @user_id = daily_log_params[:data][:attributes][:user_id]
    @mood = daily_log_params[:data][:attributes][:mood]
    @sleep_score = daily_log_params[:data][:attributes][:sleep_score]
    @anxiety_score = daily_log_params[:data][:attributes][:anxiety_score]
    @depression_score = daily_log_params[:data][:attributes][:depression_score]
    @energy_levels = daily_log_params[:data][:attributes][:energy_levels]
    @sociability = daily_log_params[:data][:attributes][:sociability]
    @meditation = daily_log_params[:data][:attributes][:meditation]
    @exercise = daily_log_params[:data][:attributes][:exercise]
    @notes = daily_log_params[:data][:attributes][:notes]
  end
end