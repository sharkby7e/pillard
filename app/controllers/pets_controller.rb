class PetsController < ApplicationController
  def show
    @pet = Pet.includes(:dosings).friendly.find(params[:id])
    @dosed = Dosing.any?(&:created_today?)
    @today_dosing = Dosing.created_today.first
  end
end
