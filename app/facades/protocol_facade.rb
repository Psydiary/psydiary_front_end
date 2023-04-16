class ProtocolFacade

  def self.get_protocols
    ProtocolService.get_protocols[:data].map do |protocol|
      Protocol.new(protocol)
    end
  end
end