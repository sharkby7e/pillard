require 'rails_helper'

RSpec.describe DosingsController, type: :controller do
  describe "#index" do
    it "works" do
      get :index

      expect(response).to be_successful
      expect(response.body).to have_content "Has Basil had her pill today?"
    end

    context "there is a dosing today" do
      let(:dosing) { create(:dosing) }
      it "simple says yes" do
        get :index
        expect(response.body).to have_content "Yes"
      end
    end

    context "there is no dosing today" do
    end
  end
end
