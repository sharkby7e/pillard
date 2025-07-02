FactoryBot.define do
  factory :dosing do
    association :pet
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
