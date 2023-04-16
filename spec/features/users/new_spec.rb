require 'rails_helper'
require 'faker'

describe '/users/new', type: :feature do
  describe 'as a visitor' do
    context 'when I visit the new user page' do
      it 'I see a form to create a new user' do
        visit register_path

        expect(current_path).to eq(register_path)
        expect(page).to have_content('Your Journey Start Here!')
        expect(page).to have_field(:name)
        expect(page).to have_field(:email) 
        expect(page).to have_select(:data_sharing)
        expect(page).to have_button("Begin My Journey")
      end

      it 'when I fill out the form and click submit, I am redirected to the user dashboard' do
        visit register_path

        fill_in :name, with: Faker::Name.name
        fill_in :email, with: Faker::Internet.unique.email
        select 'False', from: :data_sharing
        
        click_button 'Begin My Journey'
        
        expect(page.status_code).to eq(200)
      end
      
      it 'when I fill out the form with incomplete info and click "Begin My Journey", I am redirected to the user register page' do
        visit register_path

        fill_in :name, with: ""
        fill_in :email, with: Faker::Internet.unique.email
        select 'False', from: :data_sharing
        
        click_button 'Begin My Journey'
        
        expect(page.status_code).to eq(400)
      end
    end
  end
end