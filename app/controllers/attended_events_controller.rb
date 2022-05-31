class AttendedEventsController < ApplicationController
  before_action :authenticate_user!

  def new
    @attended_event = AttendedEvent.new
  end

  def create
    @attended_event = current_user.attended_event.build(attended_event_params)

    if @attended_event.save
      redirect_to current_event
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def attended_event_params
    params.require(:attended_event).permit(:event_id, :attendee_id)
  end
end
