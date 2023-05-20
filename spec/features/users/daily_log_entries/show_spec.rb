require 'rails_helper'

RSpec.describe 'Daily log show page' do
  # before do
  #   response = File.read('spec/fixtures/daily_log_entry.json')
  #   stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/2/daily_log_entries/1").
  #        with(
  #          headers: {
  #             'Accept'=>'*/*',
  #             'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
  #             'User-Agent'=>'Faraday v2.7.4'
  #          }).
  #        to_return(status: 200, body: response, headers: {})
  # end

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

    save_and_open_page
  end
end