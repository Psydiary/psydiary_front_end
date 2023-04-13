require 'rails_helper'

RSpec.describe 'New User page' do
  it 'exists' do
    visit '/register'
    
    expect(current_path).to eq('/register')
    expect(page).to have_content('Register a New User')
  end
end