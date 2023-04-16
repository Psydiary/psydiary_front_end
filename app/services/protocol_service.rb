class ProtocolService
  def self.get_protocols
    JSON.parse(conn.get("protocols").body, symbolize_names: true)
  end

  private

  def self.conn
    Faraday.new(url: "https://pacific-reef-79035.herokuapp.com/api/v1")
  end
end