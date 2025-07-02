class PetsController < ApplicationController
  def index
    @pets = Pet.all
  end

  def show
    @pet = Pet.includes(:dosings).friendly.find(params[:id])
  end
end
