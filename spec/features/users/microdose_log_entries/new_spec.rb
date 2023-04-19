require 'rails_helper'
#MIGHT NEED A SADPATH BUT COULDN'T THINK OF ONE?
RSpec.describe 'New Microdose Log Page' do
  context "As a logged in user when i visit the new microdose log page" do
    describe "I see a form to fill out a new microdose log entry" do
      before :each do
        visit '/login'
        within '#login_buttons' do
          fill_in 'email', with: 'torienyart@gmail.com'
          fill_in 'password', with: '1234'
          click_button 'Log In'
        end
        visit new_user_microdose_log_entry_path(1)
      end
      it "has various fields" do
        expect(page).to have_field("Mood Before")
        expect(page).to have_field("Mood After")
        expect(page).to have_field("Environment")
        expect(page).to have_field("Dosage")
        expect(page).to have_select("Intensity", options: ['low', 'medium', 'high'])
        expect(page).to have_select("Sociability", options: ['social', 'anxious', 'withdrawn'])
        expect(page).to have_field('Write your response here')
        expect(page).to have_field("Other Notes")
      end
      it "works with chatGPT" do
        within"#openai" do
          expect(page).to have_content("psilocybin")
        end
      end
      it "takes you to the user_dashboard once you fill out the form and click submit" do
        fill_in "Mood Before", with: "angsty"
        fill_in "Mood After", with: "peaceful"
        fill_in "Environment", with: "at home"
        fill_in "Dosage", with: "0.2"
        select 'medium', from: 'Intensity'
        select 'withdrawn', from: 'Sociability'
        fill_in 'Write your response here', with: 'I learned that I can let go'
        fill_in 'Other Notes', with: 'I stayed in my bed for this experience'
        click_on "Upload to the Universe"
        expect(page.current_path).to eq(user_path(1))
      end
      it "you remain on the page and have to refill the form if incorrect data type" do
        fill_in "Mood Before", with: "angsty"
        fill_in "Mood After", with: "peaceful"
        fill_in "Environment", with: "at home"
        fill_in "Dosage", with: "some"
        select 'medium', from: 'Intensity'
        select 'withdrawn', from: 'Sociability'
        fill_in 'Write your response here', with: 'I learned that I can let go'
        fill_in 'Other Notes', with: 'I stayed in my bed for this experience'
        click_on "Upload to the Universe"
        expect(page.current_path).to eq(new_user_microdose_log_entry_path(1))
        expect(page).to have_content("Please enter a decmial number for dosage like this: 0.10")
      end
    end
  end
end