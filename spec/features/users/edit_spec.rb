require 'rails_helper'

RSpec.describe 'User edit page' do
  describe 'As a visitor' do

  end

  describe 'As a registered User' do
    context 'When I visit the User Edit page (settings)' do
      before do

        visit '/users/1/settings'
      end

      xit 'exists' do
        expect(current_path).to eq('/users/1/settings')

        within('id#profile_edit') do
          expect(page).to have_field(:username)
        end
      end
    end
  end  
end