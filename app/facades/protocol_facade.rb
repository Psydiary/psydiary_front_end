class ProtocolFacade
  attr_reader :user_id, :service

  def initialize(params = {})
    @service = ProtocolService.new
    @user_id = params[:user_id]
    @params = params
  end
  
  def get_protocols
    ProtocolService.get_protocols(@user_id)[:data].map do |protocol|
      Protocol.new(protocol)
    end
  end

  def default_protocols
    ProtocolService.default_protocols[:data].map do |protocol|
      Protocol.new(protocol)
    end
  end

  def new_protocol
    response = ProtocolService.create_protocol(@params)
    protocol = JSON.parse(response.body, symbolize_names: true)
    return protocol[:errors] if protocol[:errors].present?
    Protocol.new(protocol)
  end

  def self.format_errors(errors)
    errors.map do |error|
      error.to_s
     end.join
  end
end