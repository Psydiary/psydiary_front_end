class Protocol
  attr_reader :id, :name, :description, :dose_days, :days_between_dose, :dosage, :protocol_duration, :break_duration, :other_notes, :user_id, :created_by

  def initialize(data)
    data = data[:data] if data[:data]
    @id = data[:id]
    @name = data[:attributes][:name]
    @description = data[:attributes][:description]
    @dose_days = data[:attributes][:dose_days]
    @days_between_dose = data[:attributes][:days_between_dose]
    @dosage = data[:attributes][:dosage]
    @protocol_duration = data[:attributes][:protocol_duration]
    @break_duration = data[:attributes][:break_duration]
    @other_notes = data[:attributes][:other_notes]
    @created_by = data[:attributes][:created_by]
  end
end