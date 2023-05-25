require 'rails_helper'

RSpec.describe 'Daily log show page' do
  before do
    
    @user = create(:user)

    create(:daily_log_entry, user_id: @user.id)

    @entry = DailyLogEntry.last
  end

  it 'exists' do
    visit  user_daily_log_entry_path(@user, @entry)

    expect(current_path).to eq(user_daily_log_entry_path(@user, @entry))

    within "#top_info" do
      expect(page).to have_content("#{@entry.created_at.strftime("%A, %B %d, %Y")}")
    end

    within "#details" do
      expect(page).to have_content("#{@entry.mood}")
      expect(page).to have_content("#{@entry.sleep_score}")
      expect(page).to have_content("#{@entry.anxiety_score}")
      expect(page).to have_content("#{@entry.depression_score}")
      expect(page).to have_content("#{@entry.energy_levels}")
      expect(page).to have_content("#{@entry.sociability}")
      expect(page).to have_content("#{@entry.meditation}")
      expect(page).to have_content("#{@entry.exercise}")
      expect(page).to have_content("#{@entry.notes}")
    end
  end
end