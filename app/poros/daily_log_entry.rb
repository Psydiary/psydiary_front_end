class DailyLogEntry
  attr_reader :id,
              :user_id,
              :mood,
              :depression_score,
              :anxiety_score,
              :sleep_score,
              :energy_levels,
              :notes,
              :meditation,
              :sociability,
              :exercise,
              :created_at

  def initialize(daily_log_data)
    @id = daily_log_data[:id]
    @user_id = daily_log_data[:attributes][:user_id]
    @mood = daily_log_data[:attributes][:mood]
    @depression_score = daily_log_data[:attributes][:depression_score]
    @anxiety_score = daily_log_data[:attributes][:anxiety_score]
    @sleep_score = daily_log_data[:attributes][:sleep_score]
    @energy_levels = daily_log_data[:attributes][:energy_levels]
    @exercise = daily_log_data[:attributes][:exercise]
    @meditation = daily_log_data[:attributes][:meditation]
    @sociability = daily_log_data[:attributes][:sociability]
    @notes = daily_log_data[:attributes][:notes]
    @created_at = daily_log_data[:attributes][:created_at]
  end
end