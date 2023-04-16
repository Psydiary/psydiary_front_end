class User
  attr_reader :id, :name, :email, :password, :data_sharing, :ip_address, :protocol_id

  def initialize(attrs)
    @id = attrs[:data][:id]
    @name = attrs[:data][:attributes][:name]
    @email = attrs[:data][:attributes][:email]
    @password = attrs[:data][:attributes][:password]
    @data_sharing = attrs[:data][:attributes][:data_sharing]
    @ip_address = attrs[:data][:attributes][:ip_address]
    @protocol_id = attrs[:data][:attributes][:protocol_id]
  end
end