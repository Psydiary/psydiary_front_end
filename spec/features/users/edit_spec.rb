require 'rails_helper'

RSpec.describe 'User edit page' do
  it 'exists' do
    visit '/protocols/edit'
    
    expect(current_path).to eq('/protocols/edit')
    expect(page).to have_content('Edit Protocol')
  end
end