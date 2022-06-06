class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attending = EventAttending.new
  end

  def create
    @event_attending = current_user.event_attendings.build(attended_event_id: params[:attended_event_id])

    if @event_attending.save
      redirect_to Event.find(params[:attended_event_id])
    else
      render :new, status: :unprocessable_entity
    end
  end
end
