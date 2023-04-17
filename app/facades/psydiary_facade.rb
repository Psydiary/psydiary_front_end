class PsydiaryFacade
  attr_reader :params
  def initialize(params = {})
    @params = params
    require 'pry'; binding.pry
    @edit_params = params["data"].to_i
  end

  def new_user
   response = PsydiaryService.create_user(@params)
   user = JSON.parse(response.body, symbolize_names: true)
   return user[:errors] if user[:errors].present?
   User.new(user)
  end

  def edit_user
    response = PsydiaryService.edit_user(@edit_params)
    edit_data = JSON.parse(response.body, symbolize_names: true)
    require 'pry'; binding.pry
  end
 
end