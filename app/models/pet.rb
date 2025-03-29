class Pet < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged

  has_many :dosings
end

# == Schema Information
#
# Table name: pets
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  slug       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_pets_on_slug  (slug) UNIQUE
#
