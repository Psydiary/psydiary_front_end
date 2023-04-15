require 'rails_helper'

RSpec.describe 'Login page' do
  it 'exists' do
    visit '/login'
    
    expect(current_path).to eq('/login')

    expect(page).to have_content('PsyDiary - Login')
  end

  it 'has a form to login' do
    visit '/login'

    expect(page).to have_field(:email)
    expect(page).to have_field(:password)
  end
end