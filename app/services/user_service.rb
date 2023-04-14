require 'faraday'

class UserService
  def self.create_user(user_params)
    post_url("/api/v1/users")
  end

  private

  def self.post_url(url)
    response = conn.post(url)
  end

  def self.conn
    Faraday.new(url: 'http://localhost:3000/')
  end
end