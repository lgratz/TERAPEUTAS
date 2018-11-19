class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @appointment = Appointment.new(appointment_params)
    @appointment.therapist_id = Therapist.find(params[:therapist_id])
    @appointment.user_id = current_user
    if @appointment.save
      redirect_to appointments_path
    else
      redirect_to therapist_path(":#{therapist_id}")
    end
  end

  def edit
  end

  def update
  end

  def show
  end

  def index
    @appointments = current_user.appointments.all
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:session_date)
  end
end
