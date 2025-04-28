require 'rails_helper'

RSpec.describe Dosing, type: :model do
  let(:dosing) { create(:dosing) }

  it "has a valid factory" do
    expect(dosing).to be_valid
  end

  describe "#created_today?" do
    it "returns whethor or not the dosing was created today" do
      old_dosing = create(:dosing, created_at: 1.day.ago)
      today_dosing = create(:dosing, created_at: Time.current)

      expect(old_dosing.created_today?).to be false
      expect(today_dosing.created_today?).to be true
    end
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
