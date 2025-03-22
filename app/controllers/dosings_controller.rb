class DosingsController < ApplicationController
  def index
    @dosed = Dosing.any?(&:created_today?)
  end

  def create
    if Dosing.create!
      redirect_to dosings_path
    end
  end
end
