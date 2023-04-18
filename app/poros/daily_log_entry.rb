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
              :user_id,
              :created_at

  def initialize(daily_log_data)
    daily_log_data = daily_log_data[:data] if daily_log_data[:data]
    @id = daily_log_data[:id]
    @user_id = daily_log_data[:attributes][:user_id]
    @mood = daily_log_data[:attributes][:mood]
    @sleep_score = daily_log_data[:attributes][:sleep_score]
    @anxiety_score = daily_log_data[:attributes][:anxiety_score]
    @depression_score = daily_log_data[:attributes][:depression_score]
    @energy_levels = daily_log_data[:attributes][:energy_levels]
    @sociability = daily_log_data[:attributes][:sociability]
    @meditation = daily_log_data[:attributes][:meditation]
    @exercise = daily_log_data[:attributes][:exercise]
    @notes = daily_log_data[:attributes][:notes]
    @created_at = daily_log_data[:attributes][:created_at]
  end

  
  def format_date
    DateTime.parse(@created_at.to_s).strftime("%A, %B %d, %Y")
  end
 
end