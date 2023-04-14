require 'rails_helper'

RSpec.describe 'Login page' do
  it 'exists' do
    visit '/login'
    
    expect(current_path).to eq('/login')

    expect(page).to have_content('Login')
  end

  it 'has a form to login' do
    visit '/login'
    
    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
    expect(page).to have_button('Login')
    expect(page).to have_button('Login with Google')
  end
end