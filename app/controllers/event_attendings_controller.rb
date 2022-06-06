class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attending = EventAttending.new
  end

  def create
    @event_attending = current_user.event_attendings.build(event_attending_params)

    if @event_attending.save
      redirect_to current_event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def event_attending_params
    params.require(:event_attending).permit(:attendee_id, :attended_event_id)
  end
end
