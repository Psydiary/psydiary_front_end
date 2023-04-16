class PsydiaryFacade

  def initialize(params = {})
    @params = params
  end

  def new_user
   response = PsydiaryService.create_user(@params)
   user = JSON.parse(response.body, symbolize_names: true)
  #  require 'pry'; binding.pry
   User.new(user)
  end
end