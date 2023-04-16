require 'rails_helper'

RSpec.describe 'Logs show page' do
  it 'exists' do
    visit '/users/1/logs/1'
    
    expect(current_path).to eq('/users/1/logs/1')
    expect(page).to have_content('Log Show')
  end
end