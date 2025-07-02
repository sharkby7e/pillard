require 'rails_helper'

RSpec.describe DosingsController, type: :controller do
  describe "#index" do
    let!(:basil) { create(:pet, name: "Basil") }
    let(:finch) { create(:pet, name: "Finch") }

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

      it "only does dosings for the pet that you're on" do
        get :index, params: { pet_id: finch.slug }

        expect(response.body).to have_content "No"
      end
    end

    context "there was no dosing today" do
      it "says no and has a button to dose" do
        get :index, params: { pet_id: basil.slug }

        expect(response.body).to have_content "No"
        expect(response.body).to have_button "Dose Basil"
      end
    end
  end
end
