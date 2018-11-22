class TherapistsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_therapist, only: [:show, :edit, :update, :destroy]

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

    @avg_rating = []
    @therapists.each do |therapist|
      @avg_rating << Appointment.where(therapist: therapist).average(:rating).to_i
    end
  end

  def show
    @avg_rating = Appointment.where(therapist: @therapist).average(:rating).to_i
    @appointment = Appointment.new
  end

  def new
    @therapist = Therapist.new
  end

  def create
    @therapist = Therapist.new(therapist_params)
    @therapist.user = current_user
    if @therapist.save
      set_categories
      redirect_to therapist_path(@therapist)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @therapist.update(therapist_params)
      Service.where(therapist_id: @therapist).each do |service|
        service.destroy
      end
      set_categories
      redirect_to therapist_path(@therapist)
    else
      render :edit
    end
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

  def set_categories
    params[:therapist][:category_ids].each do |id|
      if Category.exists?(id)
        service = Service.new(category: Category.find(id), therapist: @therapist)
        service.save
      end
    end
  end
end
