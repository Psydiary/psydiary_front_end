class User
  attr_reader :name, :email, :data_sharing, :ip_address

  def initialize(attrs)
    # require 'pry'; binding.pry
    @name = attrs[:name]
    @email = attrs[:email]
    @data_sharing = attrs[:data_sharing]
    @ip_address = attrs[:ip_address]
  end
end