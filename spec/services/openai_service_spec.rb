require 'rails_helper'

RSpec.describe OpenaiService do
  before :each do
    openai_response = File.read('spec/fixtures/openai.json')
    stub_request(:post, "https://api.openai.com/v1/chat/completions").
      with(
        body: "{\"model\":\"gpt-3.5-turbo\",\"messages\":[{\"role\":\"user\",\"content\":\"I'm documenting my experience with psilocybin. Can you help me with a random thought provoking journal prompt replying only with the journal prompt?\"}],\"temperature\":0.9,\"max_tokens\":100}",
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>"Bearer #{ENV['openai_key']}",
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.7.4'
        }
      ).
      to_return(status: 200, body: openai_response, headers: {})
  end

  it 'exists' do
    openai = OpenaiService.new

    expect(openai).to be_a(OpenaiService)
  end

  it 'returns a response' do
    response = OpenaiService.get_response

    expect(response).to be_a(Hash)
    
    expect(response[:choices][0][:message]).to have_key(:content)
    expect(response[:choices][0][:message][:content]).to be_a(String)
  end
end