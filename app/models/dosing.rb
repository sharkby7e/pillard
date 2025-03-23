class Dosing < ApplicationRecord
  scope :created_today, -> { where(created_at: Time.current.beginning_of_day..Time.current) }

  def created_today?
    created_at.today?
  end
end
