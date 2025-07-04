class DosingsController < ApplicationController
include ActionView::RecordIdentifier

  def index
    @pet = Pet.find_by!(slug: params[:pet_id])
    @dosed = @pet.dosings.any?(&:created_today?)
    @today_dosing = @pet.dosings.created_today.first if @dosed
  end

  def create
    @pet = Pet.friendly.find(params[:pet_id])

    @dosing = @pet.dosings.new

    if @dosing.save!
      redirect_to pet_dosings_path(@pet), status: :see_other
    end
  end
end
