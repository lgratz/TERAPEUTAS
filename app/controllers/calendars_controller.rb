class CalendarsController < ApplicationController
  def edit
    @therapist = current_user.therapist
    @calendar = @therapist.calendar
  end

  def update
    @calendar = current_user.therapist.calendar

    if @calendar.update(calendar_params)
      redirect_to therapist_path(current_user.therapist)
    else
      render :edit
    end
  end

  private

  def calendar_params
    params.require(:calendar).permit(:mon, :tue, :wed, :thu, :fri, :sat, :sun, :therapist_id)
  end
end
