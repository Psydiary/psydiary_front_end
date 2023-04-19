require 'rails_helper'

RSpec.describe 'User Login page' do
  context "As a user, when I visit the login page" do
    it 'has a form to login' do
      visit '/login'
      
      expect(page).to have_field(:email)
      expect(page).to have_field(:password)
      expect(page).to have_content('PsyDiary - Login')
    end

    it 'has a a button to Log In or link to Login through Google' do
      visit '/login'
      
      expect(page).to have_button('Log In')
      expect(page).to have_link('Log In with Google')
    end

    context "When I fill in the form with valid credentials and click Log In", :vcr do
      it "I am redirected to my dashboard" do
        visit '/login'

        fill_in :email, with: "bobbyluly@gmail.com"
        fill_in :password, with: "5678"
        click_button 'Log In'

        expect(current_path).to eq('/users/2')
        expect(page).to have_content('Welcome, Bobby Luly!')
      end
    end

    context "When I fill in the form with invalid credentials and click Log In", :vcr do
      it "I am redirected to the login page and see a flash message" do
        visit '/login'

        fill_in :email, with: "wrong@fake.com"
        fill_in :password, with: "wrong"
        click_button 'Log In'

        expect(current_path).to eq('/login')

        expect(page).to have_content('Incorrect email or password')
      end
    end

    context "when i use google oauth" do
      it "I can login with google oauth" do
        visit '/auth/google_oauth2'
        # click_link 'Log In with Google'

        save_and_open_page
      end
    end
  end
end