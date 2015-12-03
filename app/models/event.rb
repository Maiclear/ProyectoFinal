class Event < ActiveRecord::Base
  has_many :photos
  belongs_to :ong

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, source: :user

  has_many :participations
  has_many :users, through: :participations


  validates :name, presence:true
  validates :day, presence:true
  validates :address, presence:true
end
