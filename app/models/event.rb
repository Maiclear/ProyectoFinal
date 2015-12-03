class Event < ActiveRecord::Base
  has_many :photos
  belongs_to :ong

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, source: :user

  has_many :favorites, as: :favoritable
  has_many :user_favorites, through: :favorites, source: :user

  has_many :participations
  has_many :users, through: :participations

  has_many :event_tags
  has_many :tags, through: :event_tags


  validates :name, presence:true
  validates :day, presence:true
  validates :address, presence:true
end
