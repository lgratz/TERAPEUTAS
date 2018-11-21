class CalendarsController < ApplicationController
  def edit
    @calendar = current_user.therapist.calendar
  end
end
