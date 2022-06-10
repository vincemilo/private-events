class AddInvitationToEventAttendings < ActiveRecord::Migration[7.0]
  def change
    add_column :event_attendings, :invitation, :boolean
  end
end
