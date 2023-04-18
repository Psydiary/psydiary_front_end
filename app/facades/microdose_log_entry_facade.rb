class MicrodoseLogEntryFacade
  attr_reader :service, :user_id

  def initialize(params)
    @service = MicrodoseLogEntryService.new
    @user_id = params[:user_id]
    @params = params
  end

  def one_microdose_log_entry(user_id, log_id)
    microdose_log_entry = service.one_microdose_log_entry(user_id, log_id)
    MicrodoseLogEntry.new(microdose_log_entry[:data])
  end

  def new_entry
    response = PsydiaryService.create_microdose_log_entry(@params)
    entry = JSON.parse(response.body, symbolize_names: true)
    return entry[:errors] if entry[:errors].present?
    MicrodoseLogEntry.new(entry)
  end

  def self.format_errors(errors)
    errors.map do |error|
      error.to_s
      'Please enter a decmial number for dosage like this: 0.10' if error == 'Dosage is not a number'
     end.join
  end
end
