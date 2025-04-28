require 'rails_helper'

RSpec.describe DosingsController, type: :controller do
  describe "#index" do
    let!(:basil) { create(:pet, name: "Basil") }

    it "works" do
      get :index, params: { pet_id: basil.slug }

      expect(response).to be_successful
    end

    context "there was a dosing today" do
      let!(:today_dosing) { create(:dosing, pet_id: basil.id) }

      it "simple says yes" do
        get :index, params: { pet_id: basil.slug }

        expect(response.body).to have_content "Yes"
      end
    end

    context "there was no dosing today" do
      it "says no" do
        get :index, params: { pet_id: basil.slug }

        expect(response.body).to have_content "No"
        expect(response.body).to have_button "Dose Basil"
      end
    end
  end
end
