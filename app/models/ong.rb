class Ong < ActiveRecord::Base
  belongs_to :user

  has_many :events

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, source: :user

  validates :name, presence:true, uniqueness: true
  validates :description, presence:true
  validates :name, presence:true

end
