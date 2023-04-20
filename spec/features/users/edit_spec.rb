require 'rails_helper'

RSpec.describe 'User edit page' do
  describe 'As a registered User' do
    let(:user_id) { '1' }
    let(:expected_response_body) do
      {
        data: {
          id: user_id,
          type: 'user',
          attributes: {
            name: 'Someone Something',
            email: 'someone@something.com',
            protocol: {
              id: '1',
              name: 'protocol_name'
            },
            data_sharing: 'true'
          }
        }
      }
    end

    before do
      stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/#{user_id}/settings")
      .with(
        headers: {
           'Accept'=>'*/*',
           'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
           'User-Agent'=>'Faraday v2.7.4'
        }
      ).to_return(status: 200, body: expected_response_body.to_json)
    end
    
    it 'I see the page exists' do
      visit '/login'

      fill_in :email, with: "bobbyluly@gmail.com"
      fill_in :password, with: "5678"
      click_button 'Log In'

      visit user_settings_path(2)
      
      expect(page).to have_content("Settings")
      expect(current_path).to eq("/users/2/settings")

      within('section#profile_edit') do
        expect(page).to have_content("Profile Settings")
        expect(page).to have_field(:email, with: "bobbyluly@gmail.com")
        expect(page).to have_field(:old_password)
        expect(page).to have_field(:new_password)
        expect(page).to have_field(:password_conf)
        expect(page).to have_field(:data_sharing, with: true)
        expect(page).to have_button("Update & Save Changes")
      end

      within('section#protocol_settings') do
        expect(page).to have_content("Protocol Settings")
        expect(page).to have_content("Current Protocol: Stamets")
        expect(page).to have_link("View and Select Other Protocols")
      end
    end
  end  
end