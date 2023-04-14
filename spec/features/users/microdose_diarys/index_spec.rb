require 'rails_helper'

RSpec.describe 'Microdose diarys index page' do
  it 'exists' do
    visit '/users/1/microdose_diarys'
    
    expect(current_path).to eq('/users/1/microdose_diarys')

    expect(page).to have_content('Diaries Index')
  end
end