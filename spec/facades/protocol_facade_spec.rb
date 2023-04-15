require 'rails_helper'
require './app/facades/protocol_facade'

RSpec.describe ProtocolFacade do

  it 'exists' do
    protocol_facade = ProtocolFacade.new

    expect(protocol_facade).to be_a(ProtocolFacade)
  end

  # it 'has attributes' do

  # end
end