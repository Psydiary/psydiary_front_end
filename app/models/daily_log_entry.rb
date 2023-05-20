class DailyLogEntry < ApplicationRecord
  belongs_to :user
  
  enum exercise: %w(aerobic strength cardio yoga sport)
  enum sociability: %w(social anxious withdrawn)

  def formatted_date
    created_at.strftime("%A, %B %d, %Y")
  end
end