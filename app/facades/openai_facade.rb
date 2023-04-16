class OpenaiFacade

  def self.get_response
    OpenaiService.get_response[:choices][0][:message][:content]
  end
end