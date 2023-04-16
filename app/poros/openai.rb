class Openai
  attr_reader :prompt

  def initialize(data)
    @prompt = data[:choices][0][:message][:content]
  end
end