class DosingsController < ApplicationController
  include ActionView::RecordIdentifier

  def index
    @pet = Pet.find_by!(slug: params[:pet_id])
    @dosed = @pet.dosings.any?(&:created_today?)
    @today_dosing = @pet.dosings.created_today.first if @dosed

    @last_dosing_side =
      if @today_dosing.present?
        @today_dosing.side
      else
        @pet.dosings.any?
        @pet.dosings.last&.side
      end

    @dosing_side = @last_dosing_side == "left" ? :right : :left
  end

  def create
    @pet = Pet.friendly.find(params[:pet_id])

    @dosing = @pet.dosings.new(dosing_attributes)

    if @dosing.save!
      redirect_to pet_dosings_path(@pet), status: :see_other
    end
  end

  private

  def dosing_attributes
    params.require(:dosing).permit(:side)
  end
end
