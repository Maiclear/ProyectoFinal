class Event < ActiveRecord::Base
  acts_as_taggable_on :tags

  belongs_to :ong

  has_many :photos, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user

  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :user_favorites, through: :favorites, source: :user

  has_many :participations, dependent: :destroy
  has_many :users, through: :participations

  # has_many :event_tags
  # has_many :tags, through: :event_tags


  validates :name, presence:true
  validates :day, presence:true
  validates :address, presence:true


  def remove_comment user
    self.comments.where(user: user).first.delete
  end

  def commented_by?(user)
    self.user_comments.include? user
  end
end
