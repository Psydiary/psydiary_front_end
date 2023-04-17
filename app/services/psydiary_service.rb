require 'faraday'

class PsydiaryService
  def self.create_user(user_params)
    conn.post('/api/v1/users') do |req|
      req.body = user_params
    end
  end

  def self.edit_user(user_id_param)
    conn.get("/api/v1/users/#{user_id_param}/settings")
  end

  private

  def self.conn
    Faraday.new(url: 'https://pacific-reef-79035.herokuapp.com')
  end
end