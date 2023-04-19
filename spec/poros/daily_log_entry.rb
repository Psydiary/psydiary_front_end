require 'rails_helper'

RSpec.describe DailyLogEntry do
  it 'exists' do
    daily_log_info = {
      id: "1",
      attributes: {
        user_id: 2,
        mood: "Melancholy",
        depression_score: 5,
        anxiety_score: 2,
        sleep_score: 3,
        energy_levels: 2,
        exercise: 4,
        meditation: "5 min mindulness meditation",
        sociability: 3,
        notes: "Today is not the best day.",
        created_at: "April 16, 2023"
      }
    }
    daily_log_entry = DailyLogEntry.new(daily_log_info)

    expect(daily_log_entry).to be_a(DailyLogEntry)
    expect(daily_log_entry.id).to eq("1")
    expect(daily_log_entry.user_id).to eq(2)
    expect(daily_log_entry.mood).to eq("Melancholy")
    expect(daily_log_entry.depression_score).to eq(5)
    expect(daily_log_entry.anxiety_score).to eq(2)
    expect(daily_log_entry.sleep_score).to eq(3)
    expect(daily_log_entry.energy_levels).to eq(2)
    expect(daily_log_entry.exercise).to eq(4)
    expect(daily_log_entry.meditation).to eq("5 min mindulness meditation")
    expect(daily_log_entry.sociability).to eq(3)
    expect(daily_log_entry.notes).to eq("Today is not the best day.")
    expect(daily_log_entry.created_at).to eq("April 16, 2023")
  end
end