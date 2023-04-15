class User
  attr_reader :id, :name, :email, :data_sharing, :ip_address, :protocol_id

  def initialize(attrs)
    # require 'pry'; binding.pry
    # @id = attrs[:data][:id]
    @name = attrs[:name]
    @email = attrs[:email]
    @data_sharing = attrs[:data_sharing]
    @ip_address = attrs[:ip_address]
    @protocol_id = attrs[:protocol_id]
  end
end