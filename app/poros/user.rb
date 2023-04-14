class User
  attr_reader :name, :email, :allow_sharing, :ip_address

  def initialize(attrs)
    # require 'pry'; binding.pry
    @name = attrs[:name]
    @email = attrs[:email]
    @allow_sharing = attrs[:allow_sharing]
    @ip_address = attrs[:ip_address]
  end
end