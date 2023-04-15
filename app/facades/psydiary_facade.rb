class PsydiaryFacade

  def initialize(params = {})
    @params = params
  end

  def new_user
   user = PsydiaryService.create_user(@params)
  #  require 'pry'; binding.pry
   User.new(user)
  end
end