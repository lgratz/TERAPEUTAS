class CalendarsController < ApplicationController
  def create
    @therapist = Therapist.find(params[:therapist_id])
    @calendar = Calendar.new
    @calendar.therapist = @therapist
    @calendar.save
  end

  def edit
  end
end
