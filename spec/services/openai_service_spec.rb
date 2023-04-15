require 'rails_helper'

RSpec.describe OpenaiService do
  before :each do
    stub_request(:post, "https://api.openai.com/v1/chat/completions").
      with(
        body: "{\"model\":\"gpt-3.5-turbo\",\"messages\":[{\"role\":\"user\",\"content\":\"I'm documenting my experience with anti-depressants. Can you help me with a thought provoking journal prompt?\"}],\"temperature\":0.9,\"max_tokens\":100}",
        headers: {
          'Accept'=>'*/*',
          'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
          'Authorization'=>'Bearer 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',
          'Content-Type'=>'application/json',
          'User-Agent'=>'Faraday v2.7.4'
        }
      ).
      to_return(status: 200, body: "{\"choices\": [{\"text\": \"What unexpected insights or realizations did you have during your psilocybin experience, and how do you plan to integrate those into your daily life?\"}]}", headers: {})
  end

  it 'exists' do
    openai = OpenaiService.new

    expect(openai).to be_a(OpenaiService)
  end

  it 'returns a response' do
    response = OpenaiService.get_response

    expect(response).to be_a(Hash)
    expect(response["choices"][0]).to have_key("text")
    expect(response["choices"][0]["text"]).to be_a(String)
  end
end