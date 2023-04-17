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
    expect(page).to have_content('Daily Log For')
    expect(page).to have_content('Mood:')
    expect(page).to have_content('Sleep Quality:')
    expect(page).to have_content('Anxiety Score:')
    expect(page).to have_content('Depression Score:')
    expect(page).to have_content('Energy Levels:')
    expect(page).to have_content('Sociability:')
    expect(page).to have_content('Meditation:')
    expect(page).to have_content('Exercise:')
    expect(page).to have_content('Notes:')
  end

  
end