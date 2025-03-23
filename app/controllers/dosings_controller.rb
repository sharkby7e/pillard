class DosingsController < ApplicationController
  def index
    @dosed = Dosing.any?(&:created_today?)
    @today_dosing = Dosing.created_today.first
  end

  def create
    if Dosing.create!
      redirect_to dosings_path
    end
  end
end
