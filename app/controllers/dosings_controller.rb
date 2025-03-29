class DosingsController < ApplicationController
  def index
    @pet = Pet.find_by!(slug: params[:pet_id])
    @dosed = Dosing.any?(&:created_today?)
    @today_dosing = Dosing.created_today.first
  end

  def create
    @pet = Pet.friendly.find(params[:pet_id])

    if @pet.dosings.create!()
      redirect_back fallback_location: pet_dosings_path(@pet), notice: "Dosing recorded successfully."
    else
      redirect_back fallback_location: pet_dosings_path(@pet), alert: "Failed to record dosing."
    end
  end
end
