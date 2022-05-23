class AttendedEventController < ApplicationController

  def create
    @attended_event = AttendedEvent.new(attended_event_params)
  end

end
