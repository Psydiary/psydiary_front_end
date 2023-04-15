class OpenaiService
  def self.get_response 
    payload = {
      "model": "gpt-3.5-turbo",
      "messages": [
        {
          "role": "user",
          "content": "I'm documenting my experience with anti-depressants. Can you help me with a thought provoking journal prompt?"
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
    JSON.parse(response.body)
  end

  def self.conn
    Faraday.new(url: "https://api.openai.com/v1/chat/completions")
  end
end