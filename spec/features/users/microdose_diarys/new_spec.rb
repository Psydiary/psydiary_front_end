require 'rails_helper'

RSpec.describe 'Microdose diary new page' do
  it 'exists' do
    visit '/users/:id/microdose_diaries/new'
    
    expect(current_path).to eq('/users/:id/microdose_diaries/new')
    expect(page).to have_content('New Microdose Diary')
  end
end