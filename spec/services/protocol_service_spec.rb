require 'rails_helper'

RSpec.describe ProtocolService do
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