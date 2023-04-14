require 'rails_helper'

RSpec.describe 'New User page' do
  it 'exists' do
    visit '/learn_more'
    
    expect(current_path).to eq('/learn_more')
    expect(page).to have_content('About Us')
  end
end