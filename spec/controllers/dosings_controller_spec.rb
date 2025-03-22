require 'rails_helper'

RSpec.describe DosingsController, type: :controller do
  describe "#index" do
    it "works" do
      get :index

      expect(response).to be_successful
      expect(response.body).to have_content "Has Basil had her pill today?"
    end

    it "says yes if there was a dosing today" do
      create(:dosing, created_at: Time.current)

      get :index
      expect(response.body).to have_content "Yes"
    end

    it "renders a button to create a dosing if there are no dosings " do
      get :index
      expect(response.body).to have_content "No"
      expect(response.body).to have_button "Dose Basil"
    end
  end

  describe "#create" do
    it "creates a new dosing" do
      post :create

      expect { post :create }.to change { Dosing.count }.by 1
      expect(response).to be_redirect
    end
  end
end
