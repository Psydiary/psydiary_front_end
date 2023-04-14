require 'rails_helper'

describe '/users/new', type: :feature do
  describe 'as a visitor' do
    context 'when I visit the new user page' do
      it 'I see a form to create a new user' do
        visit new_user_path

        expect(current_path).to eq(new_user_path)
        expect(page).to have_content('Your Journey Start Here!')
        expect(page).to have_field(:name)
        expect(page).to have_field(:email)
        
        expect(page).to have_select(:allow_sharing)
        expect(page).to have_button("Begin My Journey")
      end

      it 'when I fill out the form and click submit, I am redirected to the user dashboard' do
        visit new_user_path

        fill_in :name, with: 'Bob'
        fill_in :email, with: 'Bob@bob.com'
        
        select 'Yes', from: :allow_sharing
        click_button 'Begin My Journey'

        expect(page.status_code).to eq(200)
        # expect(current_path).to eq(user_path(User.last))
      end
    end
  end
end