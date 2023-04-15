class ProtocolService
  def self.get_protocols
    JSON.parse(conn.get("protocols").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "http://localhost:3000/api/v1")
  end
end