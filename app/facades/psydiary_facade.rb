class PsydiaryFacade

  def initialize(params = {})
    @params = params
  end

  def new_user
   response = PsydiaryService.create_user(@params)
   user = JSON.parse(response.body, symbolize_names: true)
   return user[:errors] if user[:errors].present?
   User.new(user)
  end

  def authenticate_user
    user = PsydiaryService.authenticate_user(@params)
    return user = nil if user[:errors].present?
    User.new(user)
  end
end