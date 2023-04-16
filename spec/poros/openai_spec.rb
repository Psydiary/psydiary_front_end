require 'rails_helper'
require './app/poros/openai'
require './app/facades/openai_facade'

RSpec.describe Openai do
  let!(:info) {{
    "id": "chatcmpl-75geqrIhdPmTsVu129BUU6uGouMok",
    "object": "chat.completion",
    "created": 1681589972,
    "model": "gpt-3.5-turbo-0301",
    "usage": {
        "prompt_tokens": 31,
        "completion_tokens": 30,
        "total_tokens": 61
    },
    "choices": [
        {
            "message": {
                "role": "assistant",
                "content": "What unexpected insights or realizations did you have during your psilocybin experience, and how do you plan to integrate those into your daily life?"
            },
            "finish_reason": "stop",
            "index": 0
        }
    ]
  }}
  let!(:openai) {Openai.new(info)}

  it 'exists' do
    expect(openai).to be_a(Openai)
  end

  it 'has attributes' do
    expect(openai.prompt).to be_a(String)
    expect(openai.prompt).to eq("What unexpected insights or realizations did you have during your psilocybin experience, and how do you plan to integrate those into your daily life?")
  end
end