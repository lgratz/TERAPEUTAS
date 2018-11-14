class TherapistsController < ApplicationController

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
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end
end