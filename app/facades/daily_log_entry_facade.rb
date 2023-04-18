class DailyLogEntryFacade
  attr_reader :service

  def initialize
    @service = DailyLogEntryService.new
  end

  def daily_log_entry(user_id, log_id)
    daily_log_entry = service.daily_log_entry(user_id, log_id)
    DailyLogEntry.new(daily_log_entry[:data])
  end
end
