class Ong < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :events

  has_many :comments, as: :commentable
  has_many :user_comments, through: :comments, source: :user

  has_many :favorites, as: :favoritable
  has_many :user_favorites, through: :favorites, source: :user

  has_many :ong_categories
  has_many :categories, through: :ong_categories

  validates :name, presence:true, uniqueness: true
  validates :description, presence:true
  validates :name, presence:true

end
