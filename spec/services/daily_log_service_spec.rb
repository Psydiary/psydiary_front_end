require 'rails_helper'

RSpec.describe DailyLogEntryService do
  let(:service) { described_class.new }

  it 'exists' do
    response = File.read('spec/fixtures/daily_log_entry.json')
    stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/2/daily_log_entries/1").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: response, headers: {})

    microdose_log_entry = service.one_daily_log_entry(2, 1)

    expect(microdose_log_entry).to be_a(Hash)
    expect(microdose_log_entry[:data].keys).to eq([:id, :type, :attributes])
    expect(microdose_log_entry[:data][:id]).to be_a(String)
    expect(microdose_log_entry[:data][:id].to_i).to eq(1)
    expect(microdose_log_entry[:data][:type]).to be_a(String)
    expect(microdose_log_entry[:data][:attributes]).to be_a(Hash)
    expect(microdose_log_entry[:data][:attributes].keys.size).to eq(11)
    expect(microdose_log_entry[:data][:attributes][:user_id]).to eq(2)
  end
end