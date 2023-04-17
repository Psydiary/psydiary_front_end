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
          expect(page).to have_css('[@id=sleep_score_1]')
          expect(page).to have_css('[@id=sleep_score_2]')
          expect(page).to have_css('[@id=sleep_score_3]')
          expect(page).to have_css('[@id=sleep_score_4]')
          expect(page).to have_css('[@id=sleep_score_5]')
          expect(page).to have_css('[@id=sleep_score_6]')
          expect(page).to have_css('[@id=sleep_score_7]')
          expect(page).to have_css('[@id=sleep_score_8]')
          expect(page).to have_css('[@id=sleep_score_9]')
          expect(page).to have_css('[@id=sleep_score_10]')
        end

        within "#anxiety_score" do
          expect(page).to have_css('[@id=anxiety_score_1]')
          expect(page).to have_css('[@id=anxiety_score_2]')
          expect(page).to have_css('[@id=anxiety_score_3]')
          expect(page).to have_css('[@id=anxiety_score_4]')
          expect(page).to have_css('[@id=anxiety_score_5]')
          expect(page).to have_css('[@id=anxiety_score_6]')
          expect(page).to have_css('[@id=anxiety_score_7]')
          expect(page).to have_css('[@id=anxiety_score_8]')
          expect(page).to have_css('[@id=anxiety_score_9]')
          expect(page).to have_css('[@id=anxiety_score_10]')
        end

        within "#depression_score" do
          expect(page).to have_css('[@id=depression_score_1]')
          expect(page).to have_css('[@id=depression_score_2]')
          expect(page).to have_css('[@id=depression_score_3]')
          expect(page).to have_css('[@id=depression_score_4]')
          expect(page).to have_css('[@id=depression_score_5]')
          expect(page).to have_css('[@id=depression_score_6]')
          expect(page).to have_css('[@id=depression_score_7]')
          expect(page).to have_css('[@id=depression_score_8]')
          expect(page).to have_css('[@id=depression_score_9]')
          expect(page).to have_css('[@id=depression_score_10]')
        end

        within "#energy_level" do
          expect(page).to have_css('[@id=energy_level_1]')
          expect(page).to have_css('[@id=energy_level_2]')
          expect(page).to have_css('[@id=energy_level_3]')
          expect(page).to have_css('[@id=energy_level_4]')
          expect(page).to have_css('[@id=energy_level_5]')
          expect(page).to have_css('[@id=energy_level_6]')
          expect(page).to have_css('[@id=energy_level_7]')
          expect(page).to have_css('[@id=energy_level_8]')
          expect(page).to have_css('[@id=energy_level_9]')
          expect(page).to have_css('[@id=energy_level_10]')
        end

        expect(page).to have_select("Sociability")
        expect(page).to have_field("Meditation Minutes")
        expect(page).to have_select("Exercise")
      end
      
      it "takes you to the user_dashboard once you fill out the form and click submit" do
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

        within '#energy_level' do
          find('[@id=energy_level_5]').click
        end

        select 'withdrawn', from: 'Sociability'
        fill_in 'Meditation Minutes', with: '20'
        select 'cardio', from: 'Exercise'

      end
    end
  end
end