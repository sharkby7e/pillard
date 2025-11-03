require 'rails_helper'

RSpec.describe Pet, type: :model do
  it "has a valid factory" do
    expect(create(:pet)).to be_valid
  end
end
