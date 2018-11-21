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

    #raise("nil params") if params[:session_date].nil? || params[:category_selected].nil?
    unless params[:session_date].nil?
      @appointment.status = @appointment.session_date.to_date == Date.today ? "Aguardando rating" : "Agendado"
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
  end

  def show
  end

  def index
    @appointments = current_user.appointments.all.sort_by{|app| app.session_date}.reverse
  end

  def destroy
  end

  private

  def appointment_params
    params.require(:appointment).permit(:session_date, :category_selected)
  end
end
