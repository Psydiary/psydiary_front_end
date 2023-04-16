class DailyLogEntriesFacade
  attr_reader :user_id
  
  def initialize(params)
    @user_id = params[:user]
  end
end