require 'rails_helper'

RSpec.describe MicrodoseLogEntryFacade do
  let(:facade) { described_class.new }

  describe "one_microdose_log_entry" do
    it 'returns a microdose_log_entry object' do
      response = File.read('spec/fixtures/microdose_log_entry.json')
      stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/2/microdose_log_entries/1").
          with(
            headers: {
                'Accept'=>'*/*',
                'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
                'User-Agent'=>'Faraday v2.7.4'
            }).
          to_return(status: 200, body: response, headers: {})

      microdose_log_entry = facade.one_microdose_log_entry(2, 1)

      expect(microdose_log_entry).to be_a(MicrodoseLogEntry)
      expect(microdose_log_entry.id).to eq("1")
      expect(microdose_log_entry.user_id).to eq(2)
      expect(microdose_log_entry.dosage).to be_a(Float)
      expect(microdose_log_entry.dosage).to eq(0.75)
    end
  end
end