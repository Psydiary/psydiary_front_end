require 'rails_helper'

RSpec.describe DailyLogEntry do
  before :each do
    daily_log_info = {
      id: "1",
      data: {
        id: 1,
        attributes: {
        mood: 'happy', 
        sleep_score: 10, 
        anxiety_score: 0, 
        depression_score: 3, 
        energy_levels: 8, 
        sociability: 'social', 
        meditation: '10 minutes guided', 
        exercise: 'cardio', 
        notes: 'not much', 
        user_id: 1,
        created_at: Date.today
      }}
    }
    @daily_log_entry = DailyLogEntry.new(daily_log_info)
  end

  it 'exists' do
    expect(@daily_log_entry).to be_a(DailyLogEntry)
    expect(@daily_log_entry.id).to eq(1)
    expect(@daily_log_entry.user_id).to eq(1)
    expect(@daily_log_entry.mood).to eq("happy")
    expect(@daily_log_entry.sleep_score).to eq(10)
    expect(@daily_log_entry.depression_score).to eq(3)
    expect(@daily_log_entry.anxiety_score).to eq(0)
    expect(@daily_log_entry.energy_levels).to eq(8)
    expect(@daily_log_entry.sociability).to eq("social")
    expect(@daily_log_entry.meditation).to eq("10 minutes guided")
    expect(@daily_log_entry.exercise).to eq("cardio")
    expect(@daily_log_entry.notes).to eq("not much")
  end

  it 'can format date_time' do
    expect(@daily_log_entry.format_date).to eq(Date.today.strftime("%A, %B %d, %Y"))
  end
end