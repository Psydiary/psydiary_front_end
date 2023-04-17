class UserEdit
  attr_reader :id, 
              :name, 
              :email, 
              :data_sharing, 
              :protocol_id,
              :protocol_name

  def initialize(attrs)
    @id = extract_data(attrs)[:id]
    @name = extract_attribute(attrs)[:name]
    @email = extract_attribute(attrs)[:email]
    @data_sharing = extract_attribute(attrs)[:data_sharing]
    @protocol_name = extract_attribute(attrs)[:protocol][:name]
    @protocol_id = extract_attribute(attrs)[:protocol][:id]
  end

  def extract_data(attrs)
    attrs[:data]
  end

  def extract_attribute(attrs)
    attrs[:data][:attributes]
  end
end