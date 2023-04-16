require 'rails_helper'
require './app/facades/protocol_facade'

RSpec.describe ProtocolFacade do

  it 'exists' do
    response = File.read('spec/fixtures/protocols.json')
    stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/protocols").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: response, headers: {})

    protocol_facade = ProtocolFacade.get_protocols

    expect(protocol_facade).to be_an(Array)
    
    expect(protocol_facade.last.name).to eq("Nightcap")
    expect(protocol_facade.last.name).to be_a(String)

    expect(protocol_facade[0].name).to eq("Fadiman")
    expect(protocol_facade[0].name).to be_a(String)

    expect(protocol_facade[0].dosage).to be_a(Float)
    expect(protocol_facade[0].dosage).to eq(0.2)
  end
end