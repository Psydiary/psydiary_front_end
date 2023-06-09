require 'faraday'

class PsydiaryService
  def self.create_user(user_params)
    conn.post('/api/v1/users') do |req|
      req.body = user_params
    end
  end

  def self.edit_user(user_id_param)
    response = conn.get("/api/v1/users/#{user_id_param}/settings")
  end

  def self.update_user_protocol(user_params)
    params = {}
    params[:id] = user_params[:user_id]
    params[:protocol_id] = user_params[:id]

    conn.patch("/api/v1/users/#{params[:id]}/update_protocol") do |req|
      req.body = params
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

  def self.get_entries(user_id)
    conn.get("/api/v1/users/#{user_id}/log_entries")
  end

  def self.authenticate_user(user_params)
    response = conn.post('/api/v1/login') do |req|
      req.headers = { 'CONTENT_TYPE' => 'application/json' }
      req.body = user_params
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.from_omniauth(ip_address, g_response)
    g_response[:ip_address] = ip_address
    response = conn.post('/api/v1/omniauth') do |req|
      req.body = g_response
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private

  def self.conn
    # Faraday.new(url: 'http://localhost:3000')
    Faraday.new(url: 'https://pacific-reef-79035.herokuapp.com')
  end
end