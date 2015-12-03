class EventTag < ActiveRecord::Base
  belongs_to :tag
  belongs_to :event

  validates :event_id, uniqueness: {scope: :tag_id}
end
