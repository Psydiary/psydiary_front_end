require 'rails_helper'

RSpec.describe 'Logs new page' do
  it 'exists' do
    visit '/users/1/logs/new'
    
    expect(current_path).to eq('/users/1/logs/new')

    expect(page).to have_content('New Log')
  end
end