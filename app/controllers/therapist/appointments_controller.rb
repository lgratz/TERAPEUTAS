class Therapist::AppointmentsController < ApplicationController
  def index
    @appointments = Appointment.where(therapist: current_user.therapist).all.sort_by { `&:date` }
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
