require 'rails_helper'

RSpec.describe ProtocolService do
  it 'exists' do
    protocols = ProtocolService.get_protocols

    expect(protocols).to be_an(Hash)
    expect(protocols[:data][0]).to have_key(:id)
    expect(protocols[:data][0][:id]).to be_an(String)

    expect(protocols[:data][0]).to have_key(:attributes)
    expect(protocols[:data][0][:attributes]).to be_an(Hash)

    expect(protocols[:data][0][:attributes]).to have_key(:name)
    expect(protocols[:data][0][:attributes][:name]).to be_an(String)

    expect(protocols[:data][0][:attributes]).to have_key(:description)
    expect(protocols[:data][0][:attributes][:description]).to be_an(String)
  end
end