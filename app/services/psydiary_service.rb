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

  def self.create_microdose_log_entry(entry_params)
    conn.post("/api/v1/users/#{entry_params[:user_id]}/microdose_log_entries") do |req|
      req.body = entry_params
    end
  end

  def self.get_user(user_id)
    conn.get("/api/v1/users/#{user_id}")
  end

  def self.get_recent_entries(user_id)
    conn.get("/api/v1/users/#{user_id}/log_entries")
  end

  def self.authenticate_user(user_params)
    response = conn.post('/api/v1/login') do |req|
      req.headers = { 'CONTENT_TYPE' => 'application/json' }
      req.body = user_params
    end
    
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: 'https://pacific-reef-79035.herokuapp.com')
  end
end