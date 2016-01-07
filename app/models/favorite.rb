class Favorite < ActiveRecord::Base
  belongs_to :user
  belongs_to :favoritable, polymorphic: true

  validates :user_id, uniqueness: {scope:[:favoritable_id, :favoritable_type]}
end
