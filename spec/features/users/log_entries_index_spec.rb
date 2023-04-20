require 'rails_helper'

RSpec.describe 'Log entry index page' do

  describe 'As a user' do
    context 'When I visit the log entry index page' do
      it 'exists', :vcr do
        visit '/login'

        fill_in :email, with: "bobbyluly@gmail.com"
        fill_in :password, with: "5678"
        click_button 'Log In'

        click_link 'Your Entries Diary'

        
        expect(page).to have_content('Journey Log')
        expect(page).to have_button('Track Your Day')
        expect(page).to have_button('Track a Microdose')
        
        within "#entry-1" do
          expect(page).to have_content("Date: ")
          expect(page).to have_content("Type: Daily Log Entry")
          expect(page).to have_link("Details", href: user_daily_log_entry_path(2,2))
        end

        within "#entry-3" do
          expect(page).to have_content("Date: ")
          expect(page).to have_content("Type: Microdose Log Entry")
          expect(page).to have_link("Details", href: user_microdose_log_entry_path(2,2))

          click_link "Details"

          expect(current_path).to eq(user_microdose_log_entry_path(2,2))
        end
      end
    end
  end
end