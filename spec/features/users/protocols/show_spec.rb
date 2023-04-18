require 'rails_helper'

RSpec.describe 'Protocol show page' do
  xit 'exists' do
    visit '/protocols/1'
    
    expect(current_path).to eq('/protocols/1')
    expect(page).to have_content('Protocol Details')
  end
end