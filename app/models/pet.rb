class Pet < ApplicationRecord
  has_many :dosings
end

# == Schema Information
#
# Table name: pets
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
