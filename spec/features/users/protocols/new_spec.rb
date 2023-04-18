require 'rails_helper'

RSpec.describe 'New protocol page' do
  it 'exists' do
    visit '/users/1/protocols/new'
    
    expect(current_path).to eq('/users/1/protocols/new')
    expect(page).to have_content('Custom Protocol')
  end

  it 'has a form to create a new protocol' do
    visit '/users/1/protocols/new'
    
    expect(page).to have_field(:name)
    expect(page).to have_field(:description)
    expect(page).to have_field(:dose_days)
    expect(page).to have_field(:days_between_dose)
    expect(page).to have_field(:dosage)
    expect(page).to have_field(:protocol_duration)
    expect(page).to have_field(:break_duration)
    expect(page).to have_field(:other_notes)
  end

  it 'can create a new protocol' do
    visit '/users/1/protocols/new'

    fill_in :name, with: 'Test Protocol'
    fill_in :description, with: 'This is a test protocol'
    fill_in :dose_days, with: '1, 2, 3, 4, 5, 6, 7'
    fill_in :days_between_dose, with: '1'
    fill_in :dosage, with: '1'
    fill_in :protocol_duration, with: '7'
    fill_in :break_duration, with: '7'
    fill_in :other_notes, with: 'This is a test protocol'

    click_on 'Create Protocol'

    expect(current_path).to eq('/users/1/protocols')
  end
end