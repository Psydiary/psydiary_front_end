require 'rails_helper'

RSpec.describe 'Daily log show page' do
  before do
    response = File.read('spec/fixtures/daily_log_entry.json')
    stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/2/daily_log_entries/1").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: response, headers: {})
  end
  it 'exists' do

    visit user_log_path(2, 1)

    expect(current_path).to eq(user_log_path(2, 1))

    within "#top_info" do
      expect(page).to have_content('Daily Log For April 16, 2023')
    end
    within "#details" do
      expect(page).to have_content('Mood: Melancholy')
      expect(page).to have_content('Sleep Quality: 3')
      expect(page).to have_content('Anxiety Score: 2')
      expect(page).to have_content('Depression Score: 5')
      expect(page).to have_content('Energy Levels: 2')
      expect(page).to have_content('Sociability: 3')
      expect(page).to have_content('Meditation: 5 min mindulness meditation')
      expect(page).to have_content('Exercise: 4')
      expect(page).to have_content('Notes:')
      expect(page).to have_content('Today was an ok day.')
    end
  end
end