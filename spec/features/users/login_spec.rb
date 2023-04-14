require 'rails_helper'

RSpec.describe 'Login page' do
  it 'exists' do
    visit '/login'
    
    expect(current_path).to eq('/login')

    expect(page).to have_content('Login')
  end
end