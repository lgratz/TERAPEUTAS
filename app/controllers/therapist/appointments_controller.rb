class Therapist::AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:update, :destroy]

  def index
    @appointments = Appointment.where(therapist: current_user.therapist).all.sort_by { |a| a.session_date }
  end

  def edit
  end

  def update
    @appointment.status = "Sem rating"
    @appointment.save

    redirect_to therapist_my_appointments_path
  end

  def destroy
    @appointment.destroy
    redirect_to therapist_my_appointments_path
  end

  private

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
