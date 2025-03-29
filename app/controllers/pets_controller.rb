class PetsController < ApplicationController
  def show
    @pet = Pet.friendly.find(params[:id])
  end
end
