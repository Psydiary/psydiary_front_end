require 'rails_helper'
#MIGHT NEED A SADPATH BUT COULDN'T THINK OF ONE?
RSpec.describe 'New Microdose Log Page' do
  context "As a logged in user when i visit the new microdose log page" do
    describe "I see a form to fill out a new microdose log entry" do
      before :each do
        visit new_user_microdose_log_entry_path(1)
      end

      it "has various fields" do
        expect(page).to have_field("Mood Before")
        expect(page).to have_field("Mood After")
        expect(page).to have_field("Environment")
        expect(page).to have_field("Dosage")
        expect(page).to have_selector("Intensity", options: ['low', 'medium', 'high'])
        expect(page).to have_select("Sociability", options: ['social', 'anxious', 'withdrawn'])
        expect(page).to have_field("Journal Prompt Keyphrase")
        expect(page).to have_field("Journal Entry")
        expect(page).to have_field("Other Notes")
      end

      it "works with chatGPT" do
        #Dave can u plz help me understand and test this?
      end
      
      it "takes you to the user_dashboard once you fill out the form and click submit" do
        fill_in "Mood Before", with: "angsty"
        fill_in "Mood After", with: "peaceful"
        fill_in "Environment", with: "at home"
        fill_in "Dosage", with: "0.2"
        select 'medium', from: 'Intensity'
        select 'withdrawn', from: 'Sociability'
        fill_in 'Journal Prompt Keyphrase', with: 'Learning to let go'
        fill_in 'Journal Entry', with: 'I learned that I can let go'
        fill_in 'Other Notes', with: 'I stayed in my bed for this experience'
        click_on "Upload to the Universe"

        expect(page.current_path).to eq(user_path(1))
      end

      xit 'renders information the entry information on the user dashboard page' do
        fill_in "Mood Before", with: "angsty"
        fill_in "Mood After", with: "peaceful"
        fill_in "Environment", with: "at home"
        fill_in "Dosage", with: "0.2"
        select 'medium', from: 'Intensity'
        select 'withdrawn', from: 'Sociability'
        fill_in 'Journal Prompt Keyphrase', with: 'Learning to let go'
        fill_in 'Journal Entry', with: 'I learned that I can let go'
        fill_in 'Other Notes', with: 'I stayed in my bed for this experience'
        click_on "Upload to the Universe"

        expect(page.current_path).to eq(user_path(1))
        expect(page).to have_content('Microdose Log Entry from Sunday, April 16th')
        expect(page).to have_content('I stayed in my bed for this experience')
      end
    end
  end
end