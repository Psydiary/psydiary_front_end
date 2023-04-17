class PsydiaryFacade

  def initialize(params = {})
    @params = params
    @service = PsydiaryService.new
  end

  def new_user
   response = service.create_user(@params)
   user = JSON.parse(response.body, symbolize_names: true)
   return user[:errors] if user[:errors].present?
   User.new(user)
  end
end