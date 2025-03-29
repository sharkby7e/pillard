class PetsController < ApplicationController
  def index
  end

  def show
    @pet = Pet.includes(:dosings).friendly.find(params[:id])
  end
end
