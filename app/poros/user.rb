class User
  attr_reader :id, :name, :email, :data_sharing, :ip_address, :protocol_id

  def initialize(attrs)
    require 'pry'; binding.pry
    @id = attrs[:data][:id]
    @name = attrs[:data][:attributes][:name]
    @email = attrs[:data][:attributes][:email]
    @data_sharing = attrs[:data][:attributes][:data_sharing]
    @ip_address = attrs[:data][:attributes][:ip_address]
    @protocol_id = attrs[:data][:attributes][:protocol_id]
  end
end