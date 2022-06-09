class EventAttendingsController < ApplicationController
  before_action :authenticate_user!

  def new
    @event_attending = EventAttending.new
  end

  def create
    current_event = Event.find(params[:attended_event_id])
    if current_user.attended_events.include?(current_event)
      flash[:alert] = 'Already Attending!'
      redirect_to event_path(current_event), status: :unprocessable_entity
      return
    else
      @event_attending = current_user.event_attendings.build(attended_event_id: params[:attended_event_id])
    end

    if @event_attending.save
      redirect_to event_path(current_event)
    else
      redirect_to event_path(current_event), status: :unprocessable_entity
    end
  end

  def destroy
    @event_attending = current_user.event_attendings.find_by(params[:attended_event_id])
    @event_attending.destroy

    redirect_to event_path([:id]), status: :see_other
  end
end
