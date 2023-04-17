require 'rails_helper'
require './app/facades/openai_facade'

RSpec.describe OpenaiFacade do

  xit 'exists' do
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

    openai_facade = OpenaiFacade.get_response

    expect(openai_facade).to be_a(String)
    expect(openai_facade).to eq("What unexpected insights or realizations did you have during your psilocybin experience, and how do you plan to integrate those into your daily life?")
  end
end