class DosingsController < ApplicationController
  def index
    @dosed = Dosing.any?(&:created_today?)
  end
end
