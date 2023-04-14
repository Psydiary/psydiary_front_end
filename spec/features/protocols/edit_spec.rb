require 'rails_helper'

RSpec.describe 'Edit protocol page' do
  it 'exists' do
    visit '/protocols/1/edit'
    
    expect(current_path).to eq('/protocols/1/edit')
    expect(page).to have_content('Edit Protocol')
  end
end