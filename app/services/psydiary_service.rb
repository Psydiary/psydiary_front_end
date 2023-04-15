require 'faraday'

class PsydiaryService
  def self.create_user(user_params)
    conn.post('/api/v1/users') do |req|
      req.body = user_params
    end
  end

  private
  

  def self.conn
    Faraday.new(url: 'http://localhost:4000/')
  end
end