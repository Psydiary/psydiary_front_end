class PsyDiaryFacade

  def initialize(params = {})
    @params = params
  end

  def new_user
   user = PsyDiaryService.create_user(@params)
   User.new(user)
  end
end