require 'rails_helper'

RSpec.describe 'Logs index page' do
  it 'exists' do
    visit '/users/1/logs'
    
    expect(current_path).to eq('/users/1/logs')

    expect(page).to have_content('Logs Index')
  end
end