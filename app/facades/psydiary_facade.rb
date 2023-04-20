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

  #MIGHT BE ABLE TO GET RID OF THIS IF ANTONIO DOESN'T NEED IT
  def edit_user
    response = PsydiaryService.edit_user(@params[:user_id])
    user = JSON.parse(response.body, symbolize_names: true)
    return user = nil if user[:errors].present?
    UserEdit.new(user)
  end

  def update_user_protocol
    response = PsydiaryService.update_user_protocol(@params)
    user = JSON.parse(response.body, symbolize_names: true)
    return user[:errors] if user[:errors].present?
    User.new(user)
  end
 
  def user
    response = PsydiaryService.get_user(@params[:id])
    user = JSON.parse(response.body, symbolize_names: true)
    User.new(user)
  end

  def recent_entries
    response = PsydiaryService.get_recent_entries(@params[:id])
    entries_data = JSON.parse(response.body, symbolize_names: true)
    if !entries_data[:data].empty?
      entries_data[:data][0..2].map do |entry|
        if entry[:attributes][:mood]
          DailyLogEntry.new(entry)
        else
          MicrodoseLogEntry.new(entry)
        end
      end
    else
      "Nothing here yet.... Make a new entry above!"
    end
  end

  def entries
    response = PsydiaryService.get_entries(@params[:id])
    entries_data = JSON.parse(response.body, symbolize_names: true)
  
    if !entries_data[:data].empty?
      entries_data[:data].map do |entry|
        if entry[:attributes][:mood]
          DailyLogEntry.new(entry)
        else
          MicrodoseLogEntry.new(entry)
        end
      end
    else
      "Nothing here yet.... Make a new entry above!"
    end
  end

  def authenticate_user
    user = PsydiaryService.authenticate_user(@params)
    return user = nil if user[:errors].present?
    User.new(user)
  end

  def self.from_omniauth(ip_address, response)
    response = PsydiaryService.from_omniauth(ip_address, response)
    return response if response[:errors].present?
    User.new(response)    
  end
end