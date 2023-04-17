class DailyLogEntryService
  def daily_log_entry(user_id, log_id)
    response = conn.get("users/#{user_id}/daily_log_entries/#{log_id}")
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def conn
    Faraday.new(url: "https://pacific-reef-79035.herokuapp.com/api/v1/")
  end
end