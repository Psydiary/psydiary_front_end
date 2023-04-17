class PsydiaryFacade
  attr_reader :params

  def initialize(params = {})
    @params = params
  end

  def new_user
   response = PsydiaryService.create_user(@params)
   user = JSON.parse(response.body, symbolize_names: true)
   return user[:errors] if user[:errors].present?
   User.new(user)
  end

  def edit_user
    response = PsydiaryService.edit_user(@params)
    edit_data = JSON.parse(response.body, symbolize_names: true)
    UserEdit.new(edit_data)
  end
 
end