class OpenaiService
  def self.get_response 
    payload = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": "I'm documenting my experience with psilocybin. Can you help me with a random thought provoking journal prompt replying only with the journal prompt? A prompt that will envoke introspection would be good."
        }
      ],
      "temperature": 0.9,
      "max_tokens": 100
    }
    get_url(payload)
  end

  private

  def self.get_url(payload)
    response = conn.post do |req|
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = "Bearer #{ENV['openai_key']}"
      req.body = payload.to_json
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  def self.conn
    Faraday.new(url: "https://api.openai.com/v1/chat/completions")
  end
end