class TherapistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @therapists = Therapist.where.not(latitude: nil, longitude: nil)

    if params[:query].present?
      @therapists = Therapist.where("address ILIKE ?", "%#{params[:query]}%")
    else
      @therapists = Therapist.all
    end

    @markers = @therapists.map do |therapist|
      {
        lat: therapist.latitude,
        lng: therapist.longitude,
        infoWindow: { content: render_to_string(partial: "/therapists/map_box", locals: { therapist: therapist }) }
      }
    end
  end

  def show
    @therapist = Therapist.find(params[:id])
    @avg_rating = Appointment.where(therapist: @therapist).average(:rating).to_i

  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user = current_user
    if @therapist.save
      redirect_to therapist_path(@therapist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @therapist.update(therapist_params)
  end

  def destroy
    @therapist.destroy
  end

  private

  def therapist_params
    params.require(:therapist).permit(:address, :phone, :session_price, :self_description, :photos)
  end

  def set_therapist
    @therapist = Therapist.find(params[:id])
  end
end
