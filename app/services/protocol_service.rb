class ProtocolService
  def self.get_protocols(user_id)
    JSON.parse(conn.get("users/#{user_id}/protocols").body, symbolize_names: true)
  end

  def self.create_protocol(entry_params)
    response = conn.post("users/#{entry_params[:user_id]}/protocols") do |req|
      req.body = entry_params
    end
  end

  def self.default_protocols
    JSON.parse(conn.get("protocols").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://localhost:3000/api/v1/")

    # Faraday.new(url: "https://pacific-reef-79035.herokuapp.com/api/v1/")
  end
end