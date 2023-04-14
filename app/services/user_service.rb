require 'faraday'

class UserService
  def self.create_user(user_params)
    conn.post('/api/v1/users') do |req|
      req.body = user_params
    end
    # post_url("/api/v1/users?#{user_params}")
  end

  private

  # def self.post_url(url)
  #   response = conn.post(url)
  # end

  def self.conn
    Faraday.new(url: 'http://localhost:3000/')
  end
end