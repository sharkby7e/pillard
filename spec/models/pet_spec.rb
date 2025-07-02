require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "has a valid factory" do
    expect(create(:pet)).to be_valid
  end
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
