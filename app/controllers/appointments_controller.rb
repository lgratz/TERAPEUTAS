class AppointmentsController < ApplicationController
  before_action :set_appointment, only: [:update, :destroy]

  def new
  end

  def create
    @therapist = Therapist.find(params[:therapist_id])
    @appointment = Appointment.new(appointment_params)
    @appointment.therapist = @therapist
    @appointment.price = @therapist.session_price
    @appointment.user = current_user

    unless params[:session_date].nil?
      @appointment.status = @appointment.session_date.to_date == Date.today ? "Qual o rating?" : "Agendado"
    end

    if @appointment.save
      redirect_to appointments_path
    else
      redirect_to therapist_path(@therapist)
    end
  end

  def edit
  end

  def update
    @appointment.status = "Finalizado"
    @appointment.update(appointment_params)
    redirect_to appointments_path
  end

  def show
  end

  def index
    @appointments = current_user.appointments.all.sort_by{|app| app.session_date}
  end

  def destroy
    @appointment.destroy
    redirect_to appointments_path
  end

  private

  def appointment_params
    params.require(:appointment).permit(:session_date, :category_selected, :rating)
  end

  def set_appointment
    @appointment = Appointment.find(params[:id])
  end
end
