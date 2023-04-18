require 'rails_helper'

describe 'as a visitor' do
  describe 'when i visit the root/welcome page' do

    before :each do
      visit '/'
    end

    it 'i see a link to login, register, and learn more' do
      expect(page).to have_link 'Log In'
      expect(page).to have_link 'Register'
    end

    it 'if I am already logged in I see a link to log out and visit my dashboard, not login and register' do
      visit login_path
      within "#login_buttons" do
        fill_in 'email', with: 'torienyart@gmail.com'
        fill_in 'password', with: '1234'
        click_on 'Log In'
      end

      expect(page).to have_button 'Log Out'
      expect(page).to have_button 'My Dashboard'
      expect(page).to_not have_link 'Register'
      expect(page).to_not have_link 'Log In'

      click_on 'Log Out'

      expect(page).to have_link 'Log In'
      expect(page).to have_link 'Register'
    end

    it 'I also see a paragraph about psydiary' do
      expect(page).to have_content 'The App to Bring You Home'
      expect(page).to have_content "As psilocybin has started to receive more attention in the mental health space and become legal to consume in multiple states the interest in receiving treatment has grown. Unfortunately the accessibility to clinics/clinicians providing this treatment is slow to take off. As individuals are seeking out self-treatment by way of growing and consuming at home, Psydiary hopes to provide a structured way for users to track their experience with self-guided-treatment."
    end

    it 'I also see the psydiary logo and a button to track your journey' do
      expect(page).to have_content('Track Your Journey')
      expect(page).to have_button('Begin Here')
      # expect(page).to have_xpath("//img[contains(@src,'/app/assets/images/logo.png')]")
    end
  end
end

describe 'as a logged-in user' do
  describe 'when i visit the root/welcome page' do

    before :each do
      #login users here!
      visit '/'
    end

    xit 'I see a button to log out and learn more' do

    end

    xit 'I do not see a button to register or login' do

    end
  end
end