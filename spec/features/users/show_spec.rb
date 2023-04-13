require 'rails_helper'

RSpec.describe 'User show page' do
  it 'exists' do
    visit '/users/1'
    
    expect(current_path).to eq('/users/1')
    expect(page).to have_content('User Profile')
  end
end