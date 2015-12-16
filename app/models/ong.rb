class Ong < ActiveRecord::Base
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :events, dependent: :destroy

  has_many :comments, as: :commentable, dependent: :destroy
  has_many :user_comments, through: :comments, source: :user

  has_many :favorites, as: :favoritable, dependent: :destroy
  has_many :user_favorites, through: :favorites, source: :user

  has_many :ong_categories
  has_many :categories, through: :ong_categories

  validates :name, presence:true, uniqueness: true
  validates :description, presence:true
  validates :mail, presence:true

  def to_s
    "#{self.name}"
  end

end
