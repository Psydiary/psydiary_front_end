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
        
        expect(page).to have_select(:data_sharing)
        expect(page).to have_button("Begin My Journey")
      end

      it 'when I fill out the form and click submit, I am redirected to the user dashboard' do
        visit new_user_path
        user1 = FactoryBot.build(:user, ip_address: "192.199.248.75")

        fill_in :name, with: user1.name
        fill_in :email, with: user1.email
        select 'Yes', from: :data_sharing

        click_button 'Begin My Journey'

        expect(page.status_code).to eq(200)
      end
    end
  end
end