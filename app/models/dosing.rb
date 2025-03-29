class Dosing < ApplicationRecord
  belongs_to :pet

  scope :created_today, -> { where(created_at: Time.current.beginning_of_day..Time.current) }

  def created_today?
    created_at.today?
  end
end

# == Schema Information
#
# Table name: dosings
#
#  id         :bigint           not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pet_id     :integer          not null
#
