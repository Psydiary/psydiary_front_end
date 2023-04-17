require 'rails_helper'

RSpec.describe MicrodoseLogEntry do
  before :each do
    @microdose_log_info = {
      id: "1",
      attributes: {
        user_id: 2,
        mood_before: "Happy",
        mood_after: "Happier",
        environment: "Home",
        dosage: 0.75,
        intensity: "Medium",
        sociability: "High",
        journal_prompt: "What did you do today?",
        journal_entry: "I did a lot of things today.",
        other_notes: "I'm feeling great!",
        created_at: Date.today
      }
    }
    @microdose_log_entry = MicrodoseLogEntry.new(@microdose_log_info)
  end
  it 'exists' do
    expect(@microdose_log_entry).to be_a(MicrodoseLogEntry)
    expect(@microdose_log_entry.id).to eq("1")
    expect(@microdose_log_entry.user_id).to eq(2)
    expect(@microdose_log_entry.mood_before).to eq("Happy")
    expect(@microdose_log_entry.mood_after).to eq("Happier")
    expect(@microdose_log_entry.environment).to eq("Home")
    expect(@microdose_log_entry.dosage).to eq(0.75)
    expect(@microdose_log_entry.intensity).to eq("Medium")
    expect(@microdose_log_entry.sociability).to eq("High")
    expect(@microdose_log_entry.journal_prompt).to eq("What did you do today?")
    expect(@microdose_log_entry.journal_entry).to eq("I did a lot of things today.")
    expect(@microdose_log_entry.other_notes).to eq("I'm feeling great!")
    expect(@microdose_log_entry.created_at).to eq(Date.today)
  end

  it 'can format date_time' do
    expect(@microdose_log_entry.format_date).to eq(Date.today.strftime("%A, %B %d, %Y"))
  end
end