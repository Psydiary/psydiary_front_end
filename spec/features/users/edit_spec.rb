require 'rails_helper'

RSpec.describe 'User edit page' do
  it 'exists' do
    visit '/users/1/edit'
    
    expect(current_path).to eq('/users/1/edit')
    expect(page).to have_content('Edit Protocol')
  end
end