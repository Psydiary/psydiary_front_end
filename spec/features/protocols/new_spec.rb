require 'rails_helper'

RSpec.describe 'New protocol page' do
  it 'exists' do
    visit '/protocols/new'
    
    expect(current_path).to eq('/protocols/new')
    expect(page).to have_content('Custom Protocol')
  end
end