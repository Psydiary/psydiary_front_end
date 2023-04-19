require 'rails_helper'
require 'faker'

describe '/users/new', type: :feature do
  describe 'as a visitor' do
    context 'when I visit the new user page' do
      xit 'I see a form to create a new user' do
        visit register_path

        expect(current_path).to eq(register_path)
        expect(page).to have_content('Your Journey Starts Here!')
        expect(page).to have_field(:name)
        expect(page).to have_field(:email) 
        expect(page).to have_select(:data_sharing)
        
        expect(page).to have_css('[@id=protocol_id_5]')
        expect(page).to have_css('[@id=protocol_id_6]')
        expect(page).to have_css('[@id=protocol_id_7]')
        expect(page).to have_button("Begin My Journey")
        expect(page).to have_link('Log In with Google')
      end

      xit 'when I fill out the form and click submit, I am redirected to the user dashboard' do
        visit register_path
        @user = attributes_for(:user, ip_address: '73.153.161.252')
        fill_in :name, with: @user[:name]
        fill_in :email, with: @user[:email]
        fill_in :password, with: @user[:password]

        within '#protocols' do
          find('[@id=protocol_id_5]').click
        end

        select 'False', from: :data_sharing
        
        click_button 'Begin My Journey'

        save_and_open_page

        expect(page).to have_content("Welcome Home, #{@user[:name].split.first}")
      end

      it 'when I fill out the form with incomplete info and click "Begin My Journey", I am redirected to the user register page' do
        visit register_path

        fill_in :name, with: ""
        fill_in :email, with: Faker::Internet.unique.email
        select 'False', from: :data_sharing
        
        
        click_button 'Begin My Journey'
        expect(page).to have_content("Could not create user")
        expect(current_path).to eq(register_path)
      end
    end
  end
end