class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
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
    params.require(:appointment).permit(:session_date, :price, :status, :rating)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end

end
