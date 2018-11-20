class AppointmentsController < ApplicationController
  def new
    @appointment = Appointment.new
  end

  def create
    @therapist = Therapist.find(params[:therapist_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.therapist = @therapist
    @appointment.price = @therapist.session_price
    @appointment.user = current_user
    if @appointment.save
      redirect_to appointments_path
    else
      redirect_to therapist_path(@therapist)
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
    params.require(:appointment).permit(:session_date, :category_selected)
  end
end
