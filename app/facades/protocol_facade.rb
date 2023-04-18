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

  def new_protocol
    response = ProtocolService.create_protocol(@params)
    protocol = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
    # if response[:error]
    #   Protocol.new({}).tap { |p| p.errors.add(:base, response[:error]) }
    # else
    Protocol.new(response[:data])
    # end
  end
end