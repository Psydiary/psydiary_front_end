class MicrodoseLogEntryFacade
  attr_reader :service

  def initialize
    @service = MicrodoseLogEntryService.new
  end

  def one_microdose_log_entry(user_id, log_id)
    microdose_log_entry = service.one_microdose_log_entry(user_id, log_id)
    MicrodoseLogEntry.new(microdose_log_entry[:data])
  end
end
