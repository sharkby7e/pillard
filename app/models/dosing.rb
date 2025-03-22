class Dosing < ApplicationRecord
  def created_today?
    created_at.today?
  end
end
