require 'rails_helper'

RSpec.describe 'User edit page' do
  describe 'As a visitor' do

  end

  describe 'As a registered User' do

    context 'When I visit the User Edit page (settings)' do
      before do
        visit '/users/1/settings'
      end

      it 'exists' do
        expect(current_path).to eq('/users/1/settings')

        within('section#profile_edit') do
          expect(page).to have_field(:email)
          expect(page).to have_field(:old_password)
          expect(page).to have_field(:new_password)
          expect(page).to have_field(:password_conf)
          expect(page).to have_field(:data_sharing)
          expect(page).to have_button("Update & Save Changes")
        end
      end

      
    end
  end  
end