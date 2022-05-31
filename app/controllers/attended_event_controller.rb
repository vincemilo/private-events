class AttendedEventController < ApplicationController

  def create
    @attended_event = current_user.attended_event.build(event_id: current_event.id)

    if @attended_event.save
      redirect_to @event
    else
      render :new, status: :unprocessable_entity
    end
  end
end
