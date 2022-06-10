class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :event_attendings, foreign_key: :attended_event_id, dependent: :destroy
  has_many :attendees, through: :event_attendings, dependent: :destroy
  scope :past, -> { where('date < ?', Date.today) }
  scope :upcoming, -> { where('date >= ?', Date.today) }
end
