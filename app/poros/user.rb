class User
  attr_reader :id, :name, :email, :data_sharing, :protocol_id

  def initialize(attrs)
    @id = attrs[:data][:id]
    @name = attrs[:data][:attributes][:name]
    @email = attrs[:data][:attributes][:email]
    @data_sharing = attrs[:data][:attributes][:data_sharing]
    @protocol_id = attrs[:data][:attributes][:protocol_id]
  end

  def first_name
    @name.split.first
  end
end