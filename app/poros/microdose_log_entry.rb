class MicrodoseLogEntry
  attr_reader :id,
              :user_id,
              :mood_before,
              :mood_after,
              :environment,
              :dosage,
              :intensity,
              :sociability,
              :journal_prompt,
              :journal_entry,
              :other_notes,
              :created_at

  def initialize(microdose_log_data)
    microdose_log_data = microdose_log_data[:data] if microdose_log_data[:data]
    @id = microdose_log_data[:id]
    @user_id = microdose_log_data[:attributes][:user_id]
    @mood_before = microdose_log_data[:attributes][:mood_before]
    @mood_after = microdose_log_data[:attributes][:mood_after]
    @environment = microdose_log_data[:attributes][:environment]
    @dosage = microdose_log_data[:attributes][:dosage]
    @intensity = microdose_log_data[:attributes][:intensity]
    @sociability = microdose_log_data[:attributes][:sociability]
    @journal_prompt = microdose_log_data[:attributes][:journal_prompt]
    @journal_entry = microdose_log_data[:attributes][:journal_entry]
    @other_notes = microdose_log_data[:attributes][:other_notes]
    @created_at = microdose_log_data[:attributes][:created_at]
  end

  def format_date
    DateTime.parse(@created_at.to_s).strftime("%A, %B %d, %Y")
  end
end