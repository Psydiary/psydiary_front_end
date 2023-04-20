require 'rails_helper'

RSpec.describe 'Protocols index page' do

  before :each do
    response = File.read('spec/fixtures/protocols.json')
    stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/1/protocols").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: response, headers: {})
  end

  it 'exists' do
    visit '/users/1/protocols'
    
    expect(current_path).to eq('/users/1/protocols')
  end

  it 'has a list of protocols' do
    visit "/users/1/protocols"

    expect(page).to have_content('Fadiman')
    expect(page).to have_content('Description')
    expect(page).to have_content("This protocol ensures that a long enough")
    expect(page).to have_content('Dosage: 0.2')
    expect(page).to have_content('Days Between Dose: 3')
    expect(page).to have_content('Protocol Duration: 4')
    expect(page).to have_content('Break Duration: 3')
    expect(page).to have_content('Other Notes: Taken in the morning')
  end

  it "protocols have a button to 'adopt this protocol'" do
    visit '/login'
    within '#login_buttons' do
      fill_in 'email', with: 'torienyart@gmail.com'
      fill_in 'password', with: '1234'
      click_button 'Log In'
    end
    
    visit "/users/1/protocols"

    within "#1" do
      click_button "Adopt This Protocol"
      expect(page).to have_content("This Is Your Current Protocol")
    end

  end


end