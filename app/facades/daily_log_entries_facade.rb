class DailyLogEntriesFacade
  attr_reader :user_id
  
  def initialize(params)
    @user_id = params[:user_id]
    @params = params
  end

  def new_entry
    response = PsydiaryService.create_daily_log_entry(@params)
    entry = JSON.parse(response.body, symbolize_names: true)
    return entry[:errors] if entry[:errors].present?
    DailyLogEntry.new(entry)
  end
end