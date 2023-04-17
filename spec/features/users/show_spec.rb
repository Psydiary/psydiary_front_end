require 'rails_helper'

RSpec.describe 'User show page' do
  before :each do
    visit '/users/1'
  end

  it "shows buttons for a user to navigate" do
    expect(current_path).to eq('/users/1')
    expect(page).to have_content("Welcome Home, Tori")
    expect(page).to have_select("Track Something Amazing", options: ["Track Your Day", "Track a Microdose"])
    expect(page).to have_button("My Entries Journal")
    expect(page).to have_button("Discover Something New")
  end

  xit "shows a section with the past 3 most recent user entries" do
    context "create 2 new daily entries" do
      select "Track Your Day", from: "Track Something Amazing"
      fill_in 'Mood', with: 'unmotivated'
      within '#sleep_score' do
        find('[@id=sleep_score_4]').click
      end

      within '#anxiety_score' do
        find('[@id=anxiety_score_3]').click
      end

      within '#depression_score' do
        find('[@id=depression_score_7]').click
      end

      within '#energy_levels' do
        find('[@id=energy_levels_5]').click
      end

      select 'withdrawn', from: 'Sociability'
      fill_in 'Meditation Minutes', with: '20'
      select 'cardio', from: 'Exercise'
      fill_in 'Notes', with: 'I want a capybara'
      click_on "Upload to the Universe"

      select "Track Your Day", from: "Track Something Amazing"
      fill_in 'Mood', with: 'happy!'
      within '#sleep_score' do
        find('[@id=sleep_score_7]').click
      end

      within '#anxiety_score' do
        find('[@id=anxiety_score_3]').click
      end

      within '#depression_score' do
        find('[@id=depression_score_2]').click
      end

      within '#energy_levels' do
        find('[@id=energy_levels_7]').click
      end

      select 'social', from: 'Sociability'
      fill_in 'Meditation Minutes', with: '20'
      select 'cardio', from: 'Exercise'
      fill_in 'Notes', with: 'I want an axolotl'
      click_on "Upload to the Universe"
    end

    context "create a new microdose log entry" do
      select "Track a Microdose", from: "Track Something Amazing"
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
    end

    within "#3_recent_entries" do
      within "#entry-1" do
        expect(page).to have_content("Daily Log Entry from: #{Date.today}")
        expect(page).to have_link("See More...")
        expect(page).to have_content("Sleep Score: 4")
        expect(page).to have_content("Anxiety Score: 3")
        expect(page).to have_content("Depression Score: 7")
        expect(page).to have_content("Energy Levels: 5")
      end

      within "#entry-2" do
        expect(page).to have_content("Daily Log Entry from: #{Date.today}")
        expect(page).to have_link("See More...")
        expect(page).to have_content("Sleep Score: 7")
        expect(page).to have_content("Anxiety Score: 3")
        expect(page).to have_content("Depression Score: 2")
        expect(page).to have_content("Energy Levels: 7")
      end

      within "#entry-3" do
        expect(page).to have_content("Microdose Log Entry from: #{Date.today}")
        expect(page).to have_link("See More...")
        expect(page).to have_content("Mood Befor: angsty")
        expect(page).to have_content("Mood After: peaceful")
        expect(page).to have_content("Environment: at home")
        expect(page).to have_content("Dosage: .2")
      end
    end
  end
end