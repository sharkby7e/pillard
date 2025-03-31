require 'rails_helper'

RSpec.describe PetsController, type: :controller do
  describe "#index" do
    let!(:basil) { create(:pet, name: "Basil") }

    it "works and shows links to existing pets" do
      get :index

      expect(response).to be_successful
      expect(response.body).to have_link basil.name, href: pet_path(basil)
    end
  end
end
