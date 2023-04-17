require 'faraday'

class PsydiaryService
  def self.create_user(user_params)
    conn.post('/api/v1/users') do |req|
      req.body = user_params
    end
  end

  def self.create_daily_log_entry(entry_params)
    conn.post("/api/v1/users/#{entry_params[:user_id]}/daily_log_entries") do |req|
      req.body = entry_params
    end
  end

  def self.get_user(user_id)
    conn.get("/api/v1/users/#{user_id}")
  end


  private


  def self.conn
    Faraday.new(url: 'https://pacific-reef-79035.herokuapp.com')
  end
end