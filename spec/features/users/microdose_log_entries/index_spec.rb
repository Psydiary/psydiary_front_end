require 'rails_helper'

RSpec.describe 'Microdose diaries index page' do
  it 'exists' do
    visit '/users/1/microdose_diaries'
    
    expect(current_path).to eq('/users/1/microdose_diaries')

    expect(page).to have_content('Diaries Index')
  end
end