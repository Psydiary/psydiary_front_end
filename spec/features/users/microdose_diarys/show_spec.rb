require 'rails_helper'

RSpec.describe 'Microdose diary show page' do
  before do
    response = File.read('spec/fixtures/microdose_log_entry.json')
    stub_request(:get, "https://pacific-reef-79035.herokuapp.com/api/v1/users/2/microdose_log_entries/1").
         with(
           headers: {
              'Accept'=>'*/*',
              'Accept-Encoding'=>'gzip;q=1.0,deflate;q=0.6,identity;q=0.3',
              'User-Agent'=>'Faraday v2.7.4'
           }).
         to_return(status: 200, body: response, headers: {})
  end

  it "displays all the details of a user's Microdose Diary" do
    visit '/users/2/microdose_diaries/1'

    expect(current_path).to eq('/users/2/microdose_diaries/1')

    within "#top_info" do
      expect(page).to have_content('Microdose Diary for April 16, 2023')
    end

    within "#details" do
      expect(page).to have_content("Mood Before: Melancholy")
      expect(page).to have_content("Mood After: Happy")
      expect(page).to have_content("Environment: The Park")
      expect(page).to have_content("Dosage: 0.75 grams")
      expect(page).to have_content("Intensity: low")
      expect(page).to have_content("Sociability: anxious")
      expect(page).to have_content("Other Notes: What a nice little reset this was")
    end

    within "#journal_prompt" do
      expect(page).to have_content("Journal Prompt:")
      expect(page).to have_content("How was your day?")
    end

    within "#journal_entry" do
      expect(page).to have_content("Journal Entry:")
      expect(page).to have_content("I felt great after today's microdose!")
    end
  end
end