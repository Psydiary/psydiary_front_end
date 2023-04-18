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

      @user = PsydiaryFacade.new(user_id).edit_user
    end
    
    it 'I see the page exists' do
      require 'pry'; binding.pry
      visit "/users/#{@user.id}/settings"
      
      expect(page).to have_content("Settings")
      expect(current_path).to eq("/users/#{@user.id}/settings")

      within('section#profile_edit') do
        expect(page).to have_content("Profile Settings")
        expect(page).to have_field(:email, with: @user.email)
        expect(page).to have_field(:old_password)
        expect(page).to have_field(:new_password)
        expect(page).to have_field(:password_conf)
        expect(page).to have_field(:data_sharing, with: @user.data_sharing)
        expect(page).to have_button("Update & Save Changes")
      end

      within('section#protocol_settings') do
        expect(page).to have_content("Protocol Settings")
        expect(page).to have_content("Current Protocol: #{@user.protocol_name}")
        expect(page).to have_button("Update Current Custom Protocol")
        expect(page).to have_button("Select From Our Library")
      end

      save_and_open_page
    end

    xit 'I can fill out the form with valid attributes' do

    end
  end  
end