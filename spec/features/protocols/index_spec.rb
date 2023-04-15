require 'rails_helper'

RSpec.describe 'Protocols index page' do
  it 'exists' do
    visit '/protocols'
    
    expect(current_path).to eq('/protocols')
  end

  it 'has a list of protocols' do
    visit "/protocols"

    expect(page).to have_content('Fadiman')
    expect(page).to have_content('Description')
    expect(page).to have_content("This protocol ensures that a long enough")
    expect(page).to have_content('Dosage: 0.2')
    expect(page).to have_content('Days Between Dose: 3')
    expect(page).to have_content('Protocol Duration: 4')
    expect(page).to have_content('Break Duration: 3')
    expect(page).to have_content('Other Notes: Taken in the morning')
  end
end