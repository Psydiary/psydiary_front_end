require 'rails_helper'
#MIGHT NEED A SADPATH BUT COULDN'T THINK OF ONE?
RSpec.describe 'New Daily Log Page' do
  context "As a logged in user when i visit the new daily log page" do
    describe "I see a form to fill out a new daily log entry" do
      before :each do
        visit new_user_daily_log_entry_path(1)
      end

      it "has various fields" do
        expect(page).to have_field("Mood")

        within "#sleep_score" do
          expect(page).to have_button('1')
          expect(page).to have_button('2')
          expect(page).to have_button('3')
          expect(page).to have_button('4')
          expect(page).to have_button('5')
          expect(page).to have_button('6')
          expect(page).to have_button('7')
          expect(page).to have_button('8')
          expect(page).to have_button('9')
          expect(page).to have_button('10')
        end

        within "#anxiety_score" do
          expect(page).to have_button('1')
          expect(page).to have_button('2')
          expect(page).to have_button('3')
          expect(page).to have_button('4')
          expect(page).to have_button('5')
          expect(page).to have_button('6')
          expect(page).to have_button('7')
          expect(page).to have_button('8')
          expect(page).to have_button('9')
          expect(page).to have_button('10')
        end

        within "#depression_score" do
          expect(page).to have_button('1')
          expect(page).to have_button('2')
          expect(page).to have_button('3')
          expect(page).to have_button('4')
          expect(page).to have_button('5')
          expect(page).to have_button('6')
          expect(page).to have_button('7')
          expect(page).to have_button('8')
          expect(page).to have_button('9')
          expect(page).to have_button('10')
        end

        within "#energy_levels" do
          expect(page).to have_button('1')
          expect(page).to have_button('2')
          expect(page).to have_button('3')
          expect(page).to have_button('4')
          expect(page).to have_button('5')
          expect(page).to have_button('6')
          expect(page).to have_button('7')
          expect(page).to have_button('8')
          expect(page).to have_button('9')
          expect(page).to have_button('10')
        end

        expect(page).to have_select("Sociability")
        expect(page).to have_field("Meditation Minutes")
        expect(page).to have_select("Exercise")
      end
      
      it "takes you to the user_dashboard once you fill out the form and click submit" do
        fill_in 'Mood', with: 'unmotivated'
        within '#sleep_score' do
          choose '4'
        end

        within '#anxiety_score' do
          choose '3'
        end

        within '#depression_score' do
          choose '7'
        end

        within '#energy_levels' do
          choose '2'
        end

        select 'withdrawn', from: 'Sociability'
        fill_in 'Meditation Minutes', with: '20'
        select 'cardio', from: 'Exercise'
      end
    end
  end
end